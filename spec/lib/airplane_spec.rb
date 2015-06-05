require_relative "../../lib/airplane"

RSpec.describe Airplane do
  let (:my_plane) { Airplane.new("cesna", 10, 150, 100) }
  it 'has a type' do
    expect(my_plane.type).to eq("cesna")
  end

  it 'has wingloading' do
    expect(my_plane.wingloading).to eq(10)
  end

  it 'has horsepower' do
    expect(my_plane.horsepower).to eq(150)
  end

  it 'has fuel' do
    expect(my_plane.fuel).to eq(100)
  end

  describe "#start" do
    context 'if the plane is turned off' do
      it 'returns engine was just started' do
        expect(my_plane.start).to eq("my_plane started")
      end
    end

    context 'if the plane is already on' do
      it 'returns engine has already been running' do
        my_plane.start
        expect(my_plane.start).to eq("my_plane already started")
      end
    end
  end

  describe "#takeoff" do
    context 'if the engine is not running' do
      it 'returns airplane not started, please start' do
        expect(my_plane.takeoff).to eq('airplane not started, please start')
      end
    end

    context 'if the plane was already started' do
      it 'returns airplane launched' do
        my_plane.start
        expect(my_plane.takeoff).to eq('airplane launched')
      end
    end
  end

  describe "#land" do
    context 'plane is currently flying' do
      it 'returns plane has successfully landed' do
        my_plane.start
        my_plane.takeoff
        expect(my_plane.land).to eq('airplane landed')
      end
    end

    context 'plane is not started' do
      it 'returns turn on the plane' do
        expect(my_plane.land).to eq('airplane not started, please start')
      end
    end

    context 'plane already on the ground' do
      it 'returns airplane already on the ground' do
        my_plane.start
        expect(my_plane.land).to eq('airplane already on the ground')
      end
    end
  end

  describe "#fuel" do
    context 'there is enough fuel' do
      it 'returns there is enough fuel' do
        expect(my_plane.fuel).to be > 0
      end
    end

    context 'there is not enough fuel' do
      it 'returns there is not enough fuel' do
        my_plane.start
        my_plane.takeoff
        expect(my_plane.fuel).to be <= 0
      end
    end
  end
end
