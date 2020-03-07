//
//  ViewController.swift
//  GPS
//
//  Created by Master Mac on 14/12/17.
//  Copyright © 2017 Aecio Marques Teixeira. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate {
    
    var manager = CLLocationManager()
    var overlay = MKCircle()
    var latDelta : CLLocationDegrees = 0.5
    var longDelta : CLLocationDegrees = 0.5
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    @IBAction func zoomOutButtonAction(_ sender: UIBarButtonItem) {
        
        latDelta = mapView.region.span.latitudeDelta * 2
        longDelta = mapView.region.span.longitudeDelta * 2
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func zoomInButtonAction(_ sender: UIBarButtonItem) {

        latDelta = mapView.region.span.latitudeDelta / 2
        longDelta = mapView.region.span.longitudeDelta / 2
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        mapView.setRegion(region, animated: true)
        
    }
    

    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let circuloRenderizado = MKCircleRenderer(overlay: overlay)
        circuloRenderizado.strokeColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.6)
        circuloRenderizado.fillColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.6)
        return circuloRenderizado
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let minhaLocalizacao : CLLocation = locations[0] as CLLocation
        let latitude : CLLocationDegrees = minhaLocalizacao.coordinate.latitude
        let longitude : CLLocationDegrees = minhaLocalizacao.coordinate.longitude
        let span : MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let minhaLocalizacaoAtualizada : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let regiaoMapa : MKCoordinateRegion = MKCoordinateRegion.init(center: minhaLocalizacaoAtualizada, span: span)
        self.mapView.setRegion(regiaoMapa, animated: true)
        
        let velocidade = Int(max(minhaLocalizacao.speed, 0) * 3.6)
        velocidadeLabel.text = "\(velocidade) km/h"
        
        CLGeocoder().reverseGeocodeLocation(minhaLocalizacao) { (placemarks, error) in
            if (error == nil){
                let placemark = placemarks?.first
                let endereco = placemark?.subThoroughfare != nil ? placemark?.subThoroughfare : ""
                let avenida = placemark?.thoroughfare != nil ? placemark?.thoroughfare : ""
                let pais = placemark?.country != nil ? placemark?.country : ""
                self.enderecoLabel.text = "\(endereco!) \(avenida!) \(pais!)"
            }
            if (self.mapView.overlays.isEmpty == false){
                self.mapView.removeOverlay(self.overlay)
            }
        }
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        velocidadeLabel.text = "0 km/h"
        enderecoLabel.text = ""
        mapView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

