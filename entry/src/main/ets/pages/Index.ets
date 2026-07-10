// 1. 只导入一次 http，不要重复导入
import http from '@ohos.net.http';

@Entry
@Component
struct Index {
  @State status: string = '请先输入内容';

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
      } else {
        this.status = '请求失败，状态码：' + data.responseCode;
      }
    }).catch((err: Error) => {
      this.status = '网络错误：' + err.message;
    }).finally(() => {
      httpRequest.destroy();
    });
  }

  build() {
    Column() {
      Text(this.status)
        .onClick(() => this.generatePPT())
    }
  }
}

