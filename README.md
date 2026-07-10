# SmartPPT — 鸿蒙多模板PPT生成器

> 基于 HarmonyOS NEXT / DevEco Studio 的「粘贴文字/上传文档 → 一键生成多模板PPT」原生应用。

---

## 📋 项目简介

**SmartPPT** 是一款面向 HarmonyOS NEXT 平台的原生应用，用户可通过以下方式快速生成精美PPT：
- 📝 **粘贴文字**：直接输入或粘贴大纲、笔记、报告内容
- 📄 **上传文档**：支持导入 `.txt` / `.docx` / `.md` 等常见文本格式
- 🎨 **多模板选择**：内置商务、学术、创意、极简等多种风格模板
- ⚡ **智能排版**：自动提取标题、段落、列表，匹配最佳版式

---

## 🚀 技术栈

| 层级 | 技术方案 |
|------|----------|
| 开发框架 | ArkTS + ArkUI (声明式UI) |
| 开发环境 | DevEco Studio 5.0+ |
| 最低API版本 | API 12 (HarmonyOS NEXT) |
| 文档解析 | `@ohos.file.fs` + 自定义解析器 |
| 模板引擎 | ArkUI 动态组件渲染 + JSON模板配置 |
| 导出格式 | PPTX (通过JS引擎生成) / PDF |
| 状态管理 | AppStorage + @State / @Prop / @Link |

---

## 📁 项目结构

```
SmartPPT/
├── entry/src/main/ets/
│   ├── entryability/           # EntryAbility 入口
│   ├── pages/
│   │   ├── Index.ets           # 首页（输入/上传入口）
│   │   ├── EditorPage.ets      # 内容编辑页
│   │   ├── TemplateSelect.ets  # 模板选择页
│   │   ├── PreviewPage.ets     # PPT预览页
│   │   └── ExportPage.ets     # 导出设置页
│   ├── components/
│   │   ├── TextInputPanel.ets  # 文本输入面板
│   │   ├── FileUploader.ets    # 文件上传组件
│   │   ├── SlidePreview.ets    # 单页幻灯片预览
│   │   ├── TemplateCard.ets    # 模板卡片
│   │   └── ProgressBar.ets     # 生成进度条
│   ├── model/
│   │   ├── SlideData.ets       # 幻灯片数据模型
│   │   ├── TemplateConfig.ets  # 模板配置模型
│   │   └── DocumentParser.ets  # 文档解析器
│   ├── service/
│   │   ├── SlideGenerator.ets  # PPT生成核心服务
│   │   ├── TemplateEngine.ets  # 模板渲染引擎
│   │   └── ExportService.ets   # 导出服务（PPTX/PDF）
│   └── utils/
│       ├── TextUtils.ets       # 文本处理工具
│       ├── FileUtils.ets       # 文件操作工具
│       └── Constants.ets       # 常量定义
├── entry/src/main/resources/
│   ├── rawfile/templates/      # 模板资源（JSON配置+图片）
│   ├── rawfile/fonts/          # 字体资源
│   └── media/                  # 图标、启动图
└── oh-package.json5
```

---

## ✨ 核心功能

### 1. 内容输入
| 功能 | 说明 |
|------|------|
| 文本粘贴 | 支持多行文本粘贴，自动识别标题层级（# ## ###） |
| 文档上传 | 支持 `.txt` / `.docx` / `.md` / `.pdf`（纯文本提取） |
| 剪贴板读取 | 一键读取系统剪贴板内容 |
| 语音识别 | 调用系统语音转文字接口，边说边生成大纲 |

### 2. 智能解析
- **标题提取**：基于Markdown语法或空行+缩进规则识别层级
- **列表识别**：自动将无序/有序列表转为PPT bullet points
- **段落拆分**：长文本按语义拆分为多页
- **关键词高亮**：自动提取高频关键词作为页面重点

### 3. 多模板系统
| 模板风格 | 适用场景 | 特点 |
|----------|----------|------|
| 商务经典 | 工作汇报、项目提案 | 深蓝主色、简洁图表占位 |
| 学术严谨 | 论文答辩、学术报告 | 白底黑字、公式支持、参考文献页 |
| 创意活力 | 产品发布、活动策划 | 渐变背景、大字号、图文混排 |
| 极简留白 | 品牌介绍、个人演讲 | 大量留白、单焦点排版 |
| 数据驱动 | 数据分析、财报展示 | 内置图表组件、数据可视化 |
| 国风典雅 | 文化推广、传统节日 | 水墨元素、书法字体 |

### 4. 导出与分享
- 📦 导出 `.pptx` 格式（兼容Office/WPS）
- 📄 导出 `.pdf` 格式
- 📲 通过系统分享面板分享到微信、邮件、云盘
- ☁️ 保存到华为云空间

---

## 🛠️ 快速开始

### 环境要求
- **DevEco Studio**: 5.0.0 Release 或更高版本
- **HarmonyOS SDK**: API 12+
- **Node.js**: 18.x+
- **设备/模拟器**: HarmonyOS NEXT 手机/平板

### 安装步骤

```bash
# 1. 克隆仓库
git clone https://github.com/yourusername/SmartPPT.git
cd SmartPPT

# 2. 使用 DevEco Studio 打开项目
# File → Open → 选择项目根目录

# 3. 同步依赖
# DevEco Studio 会自动识别 oh-package.json5 并下载依赖
# 或手动执行：
ohpm install

# 4. 连接设备或启动模拟器
# Tools → Device Manager → 启动本地模拟器

# 5. 运行项目
# 点击 ▶ Run 'entry'
```

---

## 📖 使用指南

### 方式一：粘贴文字生成
1. 打开应用，进入首页
2. 点击「粘贴文字」输入框
3. 粘贴你的大纲或内容（支持Markdown格式）
4. 点击「下一步」，系统自动解析结构
5. 在编辑页调整页面顺序、增删内容
6. 进入「选择模板」页，预览不同风格效果
7. 点击「生成PPT」，等待渲染完成
8. 预览确认后，导出或分享

### 方式二：上传文档生成
1. 首页点击「上传文档」
2. 从文件管理器选择 `.docx` / `.md` / `.txt` 文件
3. 系统自动提取文本并解析结构
4. 后续步骤同「方式一」

### 模板自定义（进阶）
模板采用 JSON 配置 + ArkUI 组件动态渲染，位于 `resources/rawfile/templates/`：

```json
{
  "id": "business_classic",
  "name": "商务经典",
  "cover": {
    "background": "#1a237e",
    "titleStyle": { "fontSize": 48, "fontColor": "#ffffff", "fontFamily": "HarmonyOS Sans" },
    "subtitleStyle": { "fontSize": 24, "fontColor": "#b0bec5" }
  },
  "content": {
    "background": "#ffffff",
    "titleStyle": { "fontSize": 32, "fontColor": "#1a237e" },
    "bodyStyle": { "fontSize": 18, "fontColor": "#37474f", "lineHeight": 1.6 },
    "bulletStyle": { "fontSize": 16, "bulletColor": "#1a237e" }
  },
  "components": ["TitleSlide", "ContentSlide", "ImageSlide", "ChartSlide"]
}
```

---

## 🔧 核心模块详解

### SlideGenerator（生成引擎）
```typescript
// service/SlideGenerator.ets
export class SlideGenerator {
  // 输入：解析后的结构化数据
  async generate(slideData: SlideData[], template: TemplateConfig): Promise<Slide[]> {
    const slides: Slide[] = [];

    // 1. 生成封面页
    slides.push(this.createCover(slideData[0], template.cover));

    // 2. 遍历内容页
    for (let i = 1; i < slideData.length; i++) {
      const page = slideData[i];
      const slide = this.matchLayout(page, template);
      slides.push(slide);
    }

    // 3. 生成结束页
    slides.push(this.createEndPage(template.end));

    return slides;
  }

  private matchLayout(page: SlideData, template: TemplateConfig): Slide {
    // 根据内容类型匹配最佳版式
    if (page.hasImages && page.hasCharts) return new ComplexLayout(page, template);
    if (page.isTitleOnly) return new TitleLayout(page, template);
    if (page.items.length > 5) return new ListLayout(page, template);
    return new StandardLayout(page, template);
  }
}
```

### DocumentParser（文档解析）
```typescript
// model/DocumentParser.ets
export class DocumentParser {
  async parse(fileUri: string, fileType: string): Promise<SlideData[]> {
    const content = await this.readFile(fileUri);

    switch(fileType) {
      case 'md': return this.parseMarkdown(content);
      case 'txt': return this.parsePlainText(content);
      case 'docx': return this.parseDocx(content);
      default: throw new Error('Unsupported file type');
    }
  }

  private parseMarkdown(content: string): SlideData[] {
    const lines = content.split('\n');
    const slides: SlideData[] = [];
    let currentSlide: SlideData = { title: '', items: [] };

    for (const line of lines) {
      if (line.startsWith('# ')) {
        if (currentSlide.title) slides.push({...currentSlide});
        currentSlide = { title: line.replace('# ', ''), items: [], level: 1 };
      } else if (line.startsWith('## ')) {
        currentSlide.items.push({ type: 'subtitle', text: line.replace('## ', '') });
      } else if (line.startsWith('- ')) {
        currentSlide.items.push({ type: 'bullet', text: line.replace('- ', '') });
      } else if (line.trim()) {
        currentSlide.items.push({ type: 'text', text: line.trim() });
      }
    }

    if (currentSlide.title) slides.push(currentSlide);
    return slides;
  }
}
```

---

## 📱 界面预览

```
┌─────────────────────────┐
│  SmartPPT               │
│  ─────────────────────  │
│  [📝 粘贴文字]          │
│  [📄 上传文档]          │
│                         │
│  最近生成               │
│  ┌─────┐ ┌─────┐       │
│  │季度 │ │产品 │       │
│  │汇报 │ │发布 │       │
│  └─────┘ └─────┘       │
└─────────────────────────┘

┌─────────────────────────┐
│  选择模板               │
│  ─────────────────────  │
│  [商务] [学术] [创意]   │
│  [极简] [数据] [国风]   │
│                         │
│  ┌─────────────────┐   │
│  │  预览效果        │   │
│  │  =============   │   │
│  │  实时渲染        │   │
│  └─────────────────┘   │
│         [生成PPT]       │
└─────────────────────────┘
```

---

## 🔮 未来规划

- [ ] AI智能润色：接入大模型，自动优化文案表达
- [ ] 图表生成：根据数据自动生成柱状图、饼图、折线图
- [ ] 协作编辑：多人在线实时编辑同一份PPT
- [ ] 云端同步：跨设备同步项目与模板
- [ ] 语音控制：通过语音指令调整排版、切换模板
- [ ] 插件系统：支持第三方开发者扩展模板与组件

---

## 🤝 贡献指南

欢迎提交 Issue 和 PR！

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/AmazingFeature`
3. 提交更改：`git commit -m 'Add some AmazingFeature'`
4. 推送分支：`git push origin feature/AmazingFeature`
5. 提交 Pull Request

---

## 📄 开源协议

本项目基于 [Apache-2.0](LICENSE) 协议开源。

---

## 💬 联系我们

- 📧 Email: smartppt@example.com
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/SmartPPT/issues)
- 📖 文档: [Wiki](https://github.com/yourusername/SmartPPT/wiki)

---

> 🌟 如果这个项目对你有帮助，请给它一个 Star！
