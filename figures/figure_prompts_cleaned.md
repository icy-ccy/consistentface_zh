# 网页回答图片提示词整理

来源：https://chatgpt.com/s/t_6a26f5d73dcc8191a528c3d76b13dc9a

整理说明：已逐项核对网页回答中的 8 张图。为满足“尽可能生成真人的人脸”的需求，正向提示词中将“非真人/合成人脸/剪影”等表达调整为可使用真实感人脸缩略图；负面提示词中删除了会排斥真人人脸、真实感肖像或名人脸的限制，仅保留画面质量、版式、标注可读性和风格控制类负面词。

---

## 1. Fig. 1：多证据可靠性路由适配器图

### 提示词

```text
A clean IEEE-style scientific architecture diagram for a paper titled “ConsistentFace: Reliability Routing for Dual-Prior Face Restoration”. Show three inputs on the left: degraded face image y, reference image set R, and text prompt T. From R, draw visual identity tokens V through ArcFace and PhotoMaker encoders. From T, draw text semantic tokens T_sem and attribute-slot text features. In the center, show a multi-evidence reliability estimator computing s_RT reference-text agreement, s_yR degraded-reference identity consistency, s_yT degraded-text attribute consistency, s_RR reference-set consistency, and q degradation strength. Feed these into MLP gates alpha and c. Show global fusion: visual identity tokens, text semantics, and conservative fallback token B. Add a lower branch with five attribute slots: hair, glasses/eyes, beard/mouth, age/skin, accessory/occlusion, each with slot gates alpha_a and c_a. On the right, show inserted conditioning block F_ins flowing into a diffusion restoration model. Minimal vector graphics, white background, blue-gray academic palette, thin arrows, rounded rectangles, high readability, no decorative elements, include realistic human face thumbnails or clean face icons where useful.
```

### 负面提示词

```text
cluttered diagram, 3D rendering, excessive text, low-resolution labels, colorful cartoon style, unreadable equations, watermark, logo
```

---

## 2. Fig. 2：ConsistentFace 系统总览图

### 提示词

```text
A polished system overview diagram for an IEEE image processing paper. Title inside figure: ConsistentFace dual-prior face restoration pipeline. Layout from left to right. Left column contains three inputs: degraded face observation y, candidate reference portraits R, and natural-language prompt T. The degraded image y goes to ControlNet as structural restoration guidance. The reference set R goes through ArcFace identity encoder and PhotoMaker visual encoder, then a Mix module producing K identity prompt tokens V. The prompt T goes through SDXL text encoders producing hidden tokens H and pooled semantic feature t. In the center, a reliability-routing adapter combines visual identity tokens, text semantics, attribute-slot tokens, and conservative fallback token. On the right, rewritten prompt embedding and ControlNet conditioning enter SDXL U-Net denoising, VAE decoder, and output restored face x_hat. Use realistic human face thumbnails for degraded and reference examples, clean vector style, white background, soft blue and gray accents, IEEE publication quality, precise arrows, modular blocks, no unnecessary ornamentation.
```

### 负面提示词

```text
busy poster layout, cinematic lighting, inconsistent arrows, unreadable small labels, 3D neural network mesh, decorative icons, watermark, low contrast
```

---

## 3. Fig. 3：Metric Masking 定性案例图

### 提示词

```text
A qualitative comparison figure for an academic face restoration paper illustrating metric masking. Create a clean grid with three photorealistic human face cases. Columns: ground truth target, degraded input with blur and compression, same-identity reference, output under matched prompt, output under hallucinated prompt, and metric summary. The hallucinated-prompt output should look visually sharp but subtly identity-inconsistent, with callout boxes around eyes, mouth, and hairline. Show small schematic metric bars: ArcFace decreases, while PSNR and SSIM slightly increase and LPIPS slightly decreases. Use realistic human face thumbnails with varied natural facial features. White background, thin borders, IEEE-style caption area, minimal red warning arrows for identity drift, blue-gray metric bars, high-resolution publication figure.
```

### 负面提示词

```text
surveillance image, forensic claim, exaggerated horror distortion, meme style, cluttered annotations, unreadable metric text, watermarks
```

---

## 4. Fig. 4：冲突路由类型 / Route Families 示意图

### 提示词

```text
A compact route-family taxonomy diagram for dual-prior face restoration. Use a 2 by 3 matrix of six conflict cases: matched prompt/reference, minor text conflict, major text conflict, text hallucination, visual deception, and double blind. Each cell contains a degraded face icon y, a reference-set icon R, a text-prompt bubble T, and a reliability route arrow indicating trust visual, trust text, local slot routing, or fallback. Use check marks for reliable priors and warning symbols for unreliable priors. For minor text conflict, highlight one local attribute slot such as glasses; for major conflict, highlight multiple slots; for text hallucination, show donor-identity text; for visual deception, show stale or wrong reference; for double blind, route toward fallback. Clean vector infographic, white background, academic blue-gray palette with subtle orange warnings, realistic human face thumbnails or simple face icons, readable labels.
```

### 负面提示词

```text
complicated background, too many equations, hand-drawn messy arrows, illegible labels, cartoonish exaggeration
```

---

## 5. Fig. 5：属性槽局部路由机制图

### 提示词

```text
A detailed attribute-slot routing diagram for a face restoration method. Show a natural-language prompt decomposed into five restoration-critical slots: hair, glasses/eyes, beard/mouth, age/skin, accessory/occlusion. Next to each slot, show separate reliability gates alpha_a and c_a. Use one example: the glasses text is wrong while hair and occlusion text are correct. Draw the glasses/eyes slot routing toward the visual reference, while hair and accessory/occlusion slots retain text guidance. Include a small realistic human face thumbnail or simplified face diagram with colored local regions: hair region, eye/glasses region, mouth/beard region, skin/age region, occlusion/accessory region. Use clean vector graphics, white background, subtle color coding, IEEE-style figure, precise arrows.
```

### 负面提示词

```text
medical anatomy style, noisy labels, excessive color saturation, 3D face mesh, unreadable text
```

---

## 6. Fig. 6：Same-backbone 主结果可视化图

### 提示词

```text
A clean scientific results visualization for an IEEE paper. Create three small aligned bar charts or slope charts comparing four methods: CLIP/ArcFace gate, route without fallback, RT-only route, and ConsistentFace full. Metrics: identity gap lower is better, major Attr-F1 higher is better, rank reversal lower is better. Emphasize that ConsistentFace full achieves the best identity-attribute trade-off. Use a minimalist white background, thin axes, readable labels, blue-gray palette with a single highlighted final method, publication-quality typography, no decorative icons. Include small upward/downward arrows indicating metric direction. Optional tiny realistic human face thumbnails may be used only as subtle case markers if they improve clarity.
```

### 负面提示词

```text
flashy business chart, 3D bars, gradient-heavy infographic, crowded legend, unreadable numbers, random icons, dark background
```

---

## 7. Fig. 7：Matched-$s_{RT}$ 反事实消歧图

### 提示词

```text
An academic counterfactual disambiguation figure for reliability routing. Show two cases with the same low reference-text agreement s_RT. Case A: text hallucination, reference is correct, route should trust visual identity tokens. Case B: visual deception, reference is wrong or stale, text is correct, route should trust text semantics and degraded-image evidence. In the center, show an RT-only gate receiving only s_RT and failing to distinguish the cases. On the right, show a multi-evidence gate receiving s_yR, s_yT, s_RR, and q, producing opposite routing decisions. Add a small bottom panel with overlapping s_RT distributions and separated routing outputs. Clean vector style, white background, blue-gray academic palette with orange conflict markers, realistic human face thumbnails or clean face icons, clear arrows.
```

### 负面提示词

```text
confusing causal graph, excessive equations, cluttered colors, handwritten labels, low-resolution chart
```

---

## 8. Fig. 8：失败模式与局限性分析图

### 提示词

```text
A failure-mode analysis figure for a face restoration reliability-routing paper. Show five residual failure strata as a horizontal bar chart with small schematic thumbnails: severe blur/compression, mask or hand occlusion, cross-age or stale reference, weak age/skin and accessory/makeup slots, long mixed contradictions. For each row, include a concise mitigation direction: stronger uncertainty and fallback calibration, occlusion-aware identity confidence, time-aware reference weighting, finer slot labels and human audit, compositional route labels. Use realistic human face thumbnails or clean face icons with blur, occlusion, age-gap reference, accessory ambiguity, and mixed prompt conflict. Clean IEEE appendix style, white background, gray-blue palette, subtle red warning accents, readable labels.
```

### 负面提示词

```text
forensic mugshot style, dramatic crime-scene visuals, cluttered dashboard, unreadable tiny text, sensationalistic design, watermark
```
