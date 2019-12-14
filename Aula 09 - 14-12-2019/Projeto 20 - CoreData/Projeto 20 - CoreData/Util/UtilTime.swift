    /**
     * @autor: Aécio
     * @data: 02/01/19
     * @descrição: Converte tempo em segundos para minutos e segundos
     * @versão: 1.0.0
     * @última atualização: 02/01/19
     *
     * @param tempoSegundos
     *
     * @return tempoMinutos
     *
     * @return tempoSegundosRestantes
     */

import UIKit
    
//    let timestamp = Date().currentTimeStamp()
//    print(timestamp!)
    extension Date {
        func currentTimeStamp() -> Int64! {
            return Int64(self.timeIntervalSince1970)
        }
    }

class UtilTime: NSObject {
    
    func getMinutos(segundos : Int) -> Int {
        
        return segundos / 60
        
    }
    
    func getSegundosRestantes(segundos : Int) -> Int {
        
        return segundos % 60
        
    }
    
    func getCurrentHours() -> Int {
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: date as Date)
        return hour
        
    }
    
    func getCurrentMinutes() -> Int {
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let minutes = calendar.component(.minute, from: date as Date)
        return minutes
        
    }
    
    func getCurrentSeconds() -> Int {
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let seconds = calendar.component(.second, from: date as Date)
        return seconds
        
    }
    
    func getTimeCurrentStamp() -> Int64! {
        return Int64(NSTimeIntervalSince1970)
    }
    
    func getTimeCurrentStampPlus1Hour() -> Int64! {
        return Int64(NSTimeIntervalSince1970 + 3600)
    }
    
    func getCurrentDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        //formatter.locale = Locale(identifier: "pt_BR")
        //formatter.timeZone = TimeZone(abbreviation: "UTC-3")
        let result = formatter.string(from: date)
        print(result)
        return result
        
    }
    
    func getDateFromTimeStamp(timeStamp : Int64) -> String {
        
        let date = NSDate(timeIntervalSince1970: TimeInterval(timeStamp))
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd/MM/yyy HH:mm:ss"
        //dayTimePeriodFormatter.locale = Locale(identifier: "pt_BR")
        //dayTimePeriodFormatter.timeZone = TimeZone(abbreviation: "UTC-3")
        // UnComment below to get only time
        //  dayTimePeriodFormatter.dateFormat = "hh:mm a"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
        
    }
    

}
