// EntryAbility.ets
// EntryAbility.ets
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

// ✅ 新增：定义接口，解决对象字面量无类型错误
interface AppData {
  currentPage: string;
  timestamp: number;
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'EntryAbility', 'onCreate');

    // 动态申请分布式权限
    this.requestDistributedPermission();
  }

  private async requestDistributedPermission(): Promise<void> {
    try {
      const atManager = abilityAccessCtrl.createAtManager();
      const permission: Permissions = 'ohos.permission.DISTRIBUTED_DATASYNC';

      // ✅ 修复：使用 this.context.applicationInfo.accessTokenId
      const grantStatus = await atManager.checkAccessToken(
        this.context.applicationInfo.accessTokenId,
        permission
      );

      if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
        hilog.info(0x0000, 'EntryAbility', '分布式权限已授权');
        return;
      }

      const requestPermissions: Array<Permissions> = [permission];
      const result = await atManager.requestPermissionsFromUser(
        this.context,
        requestPermissions
      );

      if (result.authResults[0] === 0) {
        hilog.info(0x0000, 'EntryAbility', '分布式权限已授权');
      } else {
        hilog.warn(0x0000, 'EntryAbility', '用户拒绝了分布式权限');
      }
    } catch (err) {
      const businessError = err as BusinessError;
      hilog.error(0x0000, 'EntryAbility', `请求权限失败: code=${businessError.code}, message=${businessError.message}`);
    }
  }

  // ✅ 修复：移除 async，返回类型不是 Promise
  onContinue(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
    hilog.info(0x0000, 'EntryAbility', 'onContinue called.');

    try {
      // ✅ 修复：使用显式接口类型
      const appData: AppData = {
        currentPage: 'pages/DetailPage',
        timestamp: Date.now()
      };
      wantParam['appData'] = JSON.stringify(appData);  // ✅ 用索引访问避免类型问题

      return AbilityConstant.OnContinueResult.AGREE;
    } catch (err) {
      hilog.error(0x0000, 'EntryAbility', 'onContinue error');
      return AbilityConstant.OnContinueResult.REJECT;
    }
  }
}