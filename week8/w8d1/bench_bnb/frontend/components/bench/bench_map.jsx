import React from 'react';
import ReactDOM from 'react-dom';
import MarkerManager from '../../util/marker_manager';

class BenchMap extends React.Component{
  constructor(props){
    super(props);

  }

  componentDidMount(){
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435 },
      zoom: 13
    };
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarketManager = new MarkerManager(this.map);
    this.MarketManager.updateMarkers(this.props.benches);
  }

  componentDidUpdate(){
    this.MarketManager.updateMarkers(this.props.benches);
  }

  render(){
    return(
      <div id='map-container' ref={ map => this.mapNode = map }>
      </div>
    );
  }
}

export default BenchMap;
