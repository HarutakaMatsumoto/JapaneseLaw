protocol 日本国の象徴 {}
protocol 日本国民統合の象徴 {}
protocol 国事に関する権能 {}
extension 国事に関する権能 {
    func 国事行為(名義: 国事に関する権能) {}
    
    // 国事に関する行為。以下の関数を上の関数から継承させたい
    func 憲法改正＿法律＿政令＿及び条例の公布() throws {}
    func 国会を召集() {
        現在の国会.召集()
    }
    func 衆議院を解散する() {
        現在の国会.衆議院 = nil
    }
    func 国会議員の総選挙の施行を公示() {}
    func 国務大臣及び法律の定めるその他の官吏の任免並びに全権委任状及び大使及び公使の信任状を認証() {}
    func 大赦_特赦_減刑_刑の執行の免除及び復権を認証() {}
    func 栄典を授与() {}
    func 批准書及び法律の定めるその他の外交文書を認証() {}
    func 外国の大使及び公使を接受() {}
    func 儀式を行ふ() {}
}
protocol 国政に関する権能 {}

var 現在の国会 = 国会()
var 現在の内閣 = 内閣()

class 皇室 {
    func 譲り渡す() throws -> 財産 {
        if !現在の国会.議決() {
            throw CancellationError()
        }
        
        return 財産()
    }
    
    func 譲り受ける(財産: 財産) throws {
        if !現在の国会.議決() {
            throw CancellationError()
        }
    }
    
    func 賜与() throws -> 財産 {
        if !現在の国会.議決() {
            throw CancellationError()
        }
        
        return 財産()
    }
}

class 天皇: 皇室, 日本国の象徴, 日本国民統合の象徴, 国事に関する権能 {
    init?(から 先代: 天皇, 皇室典範に沿う: Bool) {
        if !皇室典範に沿う {
            return nil
        }
    }
    
    // 国事に関わるすべての行為に実行しなければならない
    func 内閣の助言と承認() throws {}
    
    func 国事に関する行為の委任() throws {
        try 内閣の助言と承認()
    }
    
    func 国事行為() throws {
        国事行為(名義: self)
    }
    
    func 内閣総理大臣の任命() {
        現在の国会.内閣総理大臣の指名()
    }
    
    func 最高裁判所裁判官の任命() {
        現在の内閣.最高裁判所裁判官の指名()
    }
}

class 摂政: 国事に関する権能 {
    func 国事行為(名義: 天皇) throws {
        国事行為(名義: 名義 as 国事に関する権能)
    }
}

class 国会 {
    var 衆議院: 衆議院?
    
    func 召集() {}
    func 内閣総理大臣の指名() {}
    func 議決() -> Bool {
        true
    }
    
    class 衆議院 {
    }
}

class 内閣 {
    func 最高裁判所裁判官の指名() {}
}

class 国民 {
    let 正義と秩序を基調とする国際平和を誠実に希求する = true
    var 戦力: [戦力] {
        get {
            []
        }
        set {
        }
    }
    
    func 国権の発動たる戦争(手段: 戦争.手段) throws {
        switch 手段 {
        case .国際紛争を解決する:
            throw CancellationError()
        }
    }
    
    final func 武力の行使(手段: 戦争.手段) throws {
        switch 手段 {
        case .国際紛争を解決する:
            throw CancellationError()
        }
    }
    
    func 交戦権を認める() -> Bool {
        false
    }
}

class 戦争 {
    enum 手段 {
        case 国際紛争を解決する
    }
}

class 戦力 {
}

class 陸軍: 戦力 {
}

class 海軍: 戦力 {
}

class 空軍: 戦力 {
}

class 財産 {
}
