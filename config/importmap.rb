# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'slim-select', to: 'https://ga.jspm.io/npm:slim-select@1.27.1/dist/slimselect.min.mjs'
pin 'echarts', to: 'https://ga.jspm.io/npm:echarts@5.4.0/index.js'
pin 'tslib', to: 'https://ga.jspm.io/npm:tslib@2.3.0/tslib.es6.js'
pin 'zrender/lib/animation/Animator.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/animation/Animator.js'
pin 'zrender/lib/canvas/Painter.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/canvas/Painter.js'
pin 'zrender/lib/canvas/graphic.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/canvas/graphic.js'
pin 'zrender/lib/contain/line.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/contain/line.js'
pin 'zrender/lib/contain/polygon.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/contain/polygon.js'
pin 'zrender/lib/contain/quadratic.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/contain/quadratic.js'
pin 'zrender/lib/contain/text.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/contain/text.js'
pin 'zrender/lib/contain/util.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/contain/util.js'
pin 'zrender/lib/core/BoundingRect.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/BoundingRect.js'
pin 'zrender/lib/core/Eventful.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/Eventful.js'
pin 'zrender/lib/core/LRU.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/LRU.js'
pin 'zrender/lib/core/OrientedBoundingRect.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/OrientedBoundingRect.js'
pin 'zrender/lib/core/PathProxy.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/PathProxy.js'
pin 'zrender/lib/core/Point.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/Point.js'
pin 'zrender/lib/core/Transformable.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/Transformable.js'
pin 'zrender/lib/core/WeakMap.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/WeakMap.js'
pin 'zrender/lib/core/bbox.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/bbox.js'
pin 'zrender/lib/core/curve.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/curve.js'
pin 'zrender/lib/core/dom.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/dom.js'
pin 'zrender/lib/core/env.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/env.js'
pin 'zrender/lib/core/event.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/event.js'
pin 'zrender/lib/core/matrix.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/matrix.js'
pin 'zrender/lib/core/platform.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/platform.js'
pin 'zrender/lib/core/timsort.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/timsort.js'
pin 'zrender/lib/core/util.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/util.js'
pin 'zrender/lib/core/vector.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/core/vector.js'
pin 'zrender/lib/graphic/CompoundPath.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/CompoundPath.js'
pin 'zrender/lib/graphic/Displayable.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/Displayable.js'
pin 'zrender/lib/graphic/Group.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/Group.js'
pin 'zrender/lib/graphic/Image.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/Image.js'
pin 'zrender/lib/graphic/IncrementalDisplayable.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/IncrementalDisplayable.js'
pin 'zrender/lib/graphic/LinearGradient.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/LinearGradient.js'
pin 'zrender/lib/graphic/Path.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/Path.js'
pin 'zrender/lib/graphic/RadialGradient.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/RadialGradient.js'
pin 'zrender/lib/graphic/Text.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/Text.js'
pin 'zrender/lib/graphic/helper/parseText.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/helper/parseText.js'
pin 'zrender/lib/graphic/helper/subPixelOptimize.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/helper/subPixelOptimize.js'
pin 'zrender/lib/graphic/shape/Arc.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Arc.js'
pin 'zrender/lib/graphic/shape/BezierCurve.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/BezierCurve.js'
pin 'zrender/lib/graphic/shape/Circle.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Circle.js'
pin 'zrender/lib/graphic/shape/Ellipse.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Ellipse.js'
pin 'zrender/lib/graphic/shape/Line.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Line.js'
pin 'zrender/lib/graphic/shape/Polygon.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Polygon.js'
pin 'zrender/lib/graphic/shape/Polyline.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Polyline.js'
pin 'zrender/lib/graphic/shape/Rect.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Rect.js'
pin 'zrender/lib/graphic/shape/Ring.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Ring.js'
pin 'zrender/lib/graphic/shape/Sector.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/graphic/shape/Sector.js'
pin 'zrender/lib/svg/Painter.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/svg/Painter.js'
pin 'zrender/lib/tool/color.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/tool/color.js'
pin 'zrender/lib/tool/morphPath.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/tool/morphPath.js'
pin 'zrender/lib/tool/parseSVG.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/tool/parseSVG.js'
pin 'zrender/lib/tool/parseXML.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/tool/parseXML.js'
pin 'zrender/lib/tool/path.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/tool/path.js'
pin 'zrender/lib/zrender.js', to: 'https://ga.jspm.io/npm:zrender@5.4.0/lib/zrender.js'
