# HOT TOPIC

대학 시절 캡스톤 프로젝트로 진행했던 iOS 앱을 React + Go 기반으로 리마스터한 프로젝트입니다.

## 프로젝트 개요

기존 Swift 기반 iOS 앱 **HotTopic**는 COVID-19 국내 현황 조회와 최신 뉴스 열람 기능을 제공했습니다.

이 프로젝트는 해당 기능을 웹 애플리케이션으로 확장하여, 더 넓은 플랫폼에서 접근할 수 있도록 리마스터합니다.

## 기존 프로젝트 (Legacy)

- **플랫폼**: iOS (Swift)
- **주요 기능**
  - COVID-19 국내 시도별 현황 및 차트
  - NewsAPI 기반 최신 뉴스 목록 및 상세보기
- **사용 라이브러리**: Alamofire, Charts, SwiftAlgorithms

## 리마스터 기술 스택

| 구분 | 기술 |
|------|------|
| Frontend | React, TypeScript, Vite, Bun |
| Backend | Go, Gin |

## 프로젝트 구조

```
HOT-TOPIC/
├── frontend/       # React + TypeScript (Vite)
├── backend/        # Go + Gin
└── legacy-swift/   # 기존 Swift iOS 프로젝트
```

## 실행 방법

### Backend

```bash
cd backend
go run main.go
```

서버가 `http://localhost:8080`에서 실행됩니다.

### Frontend

```bash
cd frontend
bun install
bun run dev
```
