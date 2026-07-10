if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Index_Params {
    status?: string;
}
import http from "@ohos:net.http";
class Index extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__status = new ObservedPropertySimplePU('请先输入内容', this, "status");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: Index_Params) {
        if (params.status !== undefined) {
            this.status = params.status;
        }
    }
    updateStateVars(params: Index_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__status.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__status.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __status: ObservedPropertySimplePU<string>;
    get status() {
        return this.__status.get();
    }
    set status(newValue: string) {
        this.__status.set(newValue);
    }
    generatePPT() {
        this.status = '正在请求...';
        let httpRequest = http.createHttp();
        // 2. 给 then 的回调参数明确类型（避免 any/unknown）
        httpRequest.request('https://jsonplaceholder.typicode.com/posts/1', {
            method: http.RequestMethod.GET,
        }).then((data: http.HttpResponse) => {
            if (data.responseCode === 200) {
                this.status = '网络请求成功！下一步接入真实PPT生成API。';
                console.info('返回数据：' + JSON.stringify(data.result));
            }
            else {
                this.status = '请求失败，状态码：' + data.responseCode;
            }
        }).catch((err: Error) => {
            this.status = '网络错误：' + err.message;
        }).finally(() => {
            httpRequest.destroy();
        });
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.status);
            Text.onClick(() => this.generatePPT());
        }, Text);
        Text.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "com.example.smartptt", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false", moduleType: "followWithHap" });
