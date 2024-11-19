//
//  ContentView.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//
import Foundation
/*
 필요한 정보
 장르의 총 재생수 >> 장르:총 재생수 >> 재생수가 많은 순의 장르 배열
 장르의 인덱스-재생수 >> 장르:(인덱스, 재생수)
 */
func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var result: [Int] = []
    var genr    ToIndexAndPlay: [String:[(index: Int, play: Int)]] = [:]
    var genreToCount: [String:Int] = [:]
    var sortedGenre: [String] = []
    
    for (index, genre) in genres.enumerated() {//필요한 정보 저장
        genreToIndexAndPlay[genre, default: []].append((index, plays[index]))
        genreToCount[genre, default: 0] += plays[index]
    }
    
    //재생 수가 많은 순으로 정렬된 장르 배열 획득
    //딕셔너리 동일 키값이라 중복 제거 됨
    sortedGenre = genreToCount.sorted{ $0.value > $1.value }.map{ $0.key }
    
    //장르별 상위 2개의 play를 가진 index를 result에 추가함.
    for genre in sortedGenre {
        //play 순으로 정렬
        guard let topSongs = genreToIndexAndPlay[genre] else {return []}
        //인덱스가 작은 순 또는 재생수가 많은 순을 체크하며 정렬하기 위해 조건 필요.
        let sortedTopSongs = topSongs.sorted{ $0.play == $1.play ? $0.index < $1.index : $0.play > $1.play }
        
        result.append(sortedTopSongs[0].index)
        if topSongs.count >= 2 {
            result.append(sortedTopSongs[1].index)
        }
    }
    return result
}
