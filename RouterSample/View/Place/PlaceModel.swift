enum PlaceModel {
  struct State: Equatable {
    let placeID: Int

    static func defaultValue() -> Self {
      .init(placeID: .zero)
    }
  }

  enum ViewAction: Equatable {

  }
}
