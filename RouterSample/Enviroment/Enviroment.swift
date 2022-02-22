import Dispatch

protocol EnviromentType {

}

struct Enviroment: EnviromentType {
  var subscribeScheduler: DispatchQueue
  var receiveScheduler: DispatchQueue

  init() {
    subscribeScheduler = DispatchQueue.global()
    receiveScheduler = DispatchQueue.main
  }
}
