import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PrismaClient } from "@prisma/client";
//DB接続ロジックを定義
@Injectable()
export class PrismaService extends PrismaClient {
  constructor(config: ConfigService) {
    // eslint-disable-next-line @typescript-eslint/no-unsafe-call
    super({
      datasources: {
        db: {
          url: config.get<string>("DATABASE_URL"),
        },
      },
    });
  }
}
