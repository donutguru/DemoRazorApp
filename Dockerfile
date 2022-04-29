﻿FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "DemoRazorApp/DemoRazorApp.csproj"
COPY . DemoRazorApp
WORKDIR "/src/DemoRazorApp"
RUN dotnet build "DemoRazorApp.csproj" -c Release -o /app/build

WORKDIR /src
RUN dotnet test --logger:trx

FROM build AS publish
RUN dotnet publish "DemoRazorApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DemoRazorApp.dll"]