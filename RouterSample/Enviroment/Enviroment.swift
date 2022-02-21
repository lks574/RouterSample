import Dispatch

struct Enviroment {
  var navigator: DeepNaviProtocol
  var subscribeScheduler: DispatchQueue
  var receiveScheduler: DispatchQueue

  init(navi: DeepNaviProtocol) {
    navigator = navi
    subscribeScheduler = DispatchQueue.global()
    receiveScheduler = DispatchQueue.main
  }
}
