; ModuleID = '../data/hip_kernels/18512/0/main.cu'
source_filename = "../data/hip_kernels/18512/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { [16 x %1], [16 x %1], [16 x %1], [16 x %2], [16 x %2], [16 x [256 x %3]], i64, i64, [14 x i64], i64 }
%1 = type { i32, [15 x i64] }
%2 = type { i64, [15 x i64] }
%3 = type { i64, i64, i32 }
%4 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%5 = type { i32, i32, i32, i32, [524284 x i32] }
%6 = type { %7 addrspace(1)*, %8 addrspace(1)*, %9, i64, i64, i64 }
%7 = type { i64, i64, i32, i32 }
%8 = type { [64 x [8 x i64]] }
%9 = type { i64 }
%10 = type { i64, %9, i64, i32, i32, i64, i64, %11, [2 x i32] }
%11 = type { %12 addrspace(1)* }
%12 = type { %13, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %9, [14 x i32] }
%13 = type { i32, i32, i8 addrspace(1)*, %9, i32, i32, i64 }

@.str = private unnamed_addr addrspace(4) constant [18 x i8] c"\0A----- Id = %lld\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [35 x i8] c"\0A***** %lld, Tam = %d -> \E2\94\A4%s\E2\94\9C\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [50 x i8] c"Collision found for string \E2\94\A4%s\E2\94\9C. Hashcode %d\0A\00", align 1
@0 = internal addrspace(1) global %0 zeroinitializer, align 8
@1 = internal unnamed_addr addrspace(4) constant [16 x %4] [%4 { i32 130054, i32 129546, i32 110114, i32 16288, i32 6, i32 256, i32 0, i32 4195 }, %4 { i32 86927, i32 86758, i32 73744, i32 10904, i32 399, i32 512, i32 0, i32 2804 }, %4 { i32 65280, i32 64770, i32 55054, i32 8192, i32 0, i32 128, i32 0, i32 2107 }, %4 { i32 43576, i32 43406, i32 36895, i32 5504, i32 56, i32 256, i32 0, i32 1405 }, %4 { i32 32703, i32 32193, i32 27364, i32 4160, i32 63, i32 64, i32 0, i32 1054 }, %4 { i32 21816, i32 21646, i32 18399, i32 2816, i32 56, i32 128, i32 0, i32 703 }, %4 { i32 16367, i32 15856, i32 13477, i32 2176, i32 15, i32 32, i32 32768, i32 527 }, %4 { i32 10915, i32 10745, i32 9133, i32 1472, i32 35, i32 64, i32 0, i32 352 }, %4 { i32 8187, i32 7676, i32 6524, i32 1280, i32 11, i32 16, i32 134219776, i32 265 }, %4 { i32 5459, i32 5289, i32 4495, i32 896, i32 19, i32 32, i32 524288, i32 176 }, %4 { i32 4094, i32 3583, i32 3045, i32 1024, i32 6, i32 8, i32 1077952576, i32 133 }, %4 { i32 2730, i32 2560, i32 2176, i32 512, i32 10, i32 16, i32 67109888, i32 89 }, %4 { i32 2047, i32 1536, i32 1305, i32 1024, i32 3, i32 4, i32 -2004318072, i32 66 }, %4 { i32 1365, i32 1195, i32 1015, i32 512, i32 5, i32 8, i32 538976288, i32 44 }, %4 { i32 1023, i32 512, i32 435, i32 2048, i32 1, i32 2, i32 -1431655766, i32 34 }, %4 { i32 682, i32 512, i32 435, i32 2048, i32 2, i32 4, i32 1145324612, i32 35 }], align 4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z14findcollisionsiy(i32 %0, i64 %1) local_unnamed_addr #1 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = zext i32 %11 to i64
  %13 = add i64 %12, %1
  %14 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 100) #12
  br label %15

15:                                               ; preds = %15, %2
  %16 = phi i32 [ 0, %2 ], [ %26, %15 ]
  %17 = phi i64 [ %13, %2 ], [ %19, %15 ]
  %18 = freeze i64 %17
  %19 = udiv i64 %18, 96
  %20 = mul i64 %19, 96
  %21 = sub i64 %18, %20
  %22 = trunc i64 %21 to i8
  %23 = add nuw nsw i8 %22, 32
  %24 = zext i32 %16 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %24
  store i8 %23, i8 addrspace(1)* %25, align 1, !tbaa !7
  %26 = add nuw nsw i32 %16, 1
  %27 = icmp ult i64 %17, 96
  br i1 %27, label %28, label %15, !llvm.loop !10

28:                                               ; preds = %15
  %29 = add nuw nsw i32 %16, 2
  %30 = zext i32 %29 to i64
  %31 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %30) #12
  %32 = add nuw i32 %16, 1
  %33 = and i32 %32, 7
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %47, label %35

35:                                               ; preds = %28, %35
  %36 = phi i32 [ %44, %35 ], [ %16, %28 ]
  %37 = phi i32 [ %45, %35 ], [ 0, %28 ]
  %38 = zext i32 %36 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7
  %41 = sub nuw nsw i32 %16, %36
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %42
  store i8 %40, i8 addrspace(1)* %43, align 1, !tbaa !7
  %44 = add nsw i32 %36, -1
  %45 = add i32 %37, 1
  %46 = icmp eq i32 %45, %33
  br i1 %46, label %47, label %35, !llvm.loop !12

47:                                               ; preds = %35, %28
  %48 = phi i32 [ %16, %28 ], [ %44, %35 ]
  %49 = icmp ult i32 %16, 7
  br i1 %49, label %109, label %50

50:                                               ; preds = %47, %50
  %51 = phi i32 [ %107, %50 ], [ %48, %47 ]
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !7
  %55 = sub nuw nsw i32 %16, %51
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %56
  store i8 %54, i8 addrspace(1)* %57, align 1, !tbaa !7
  %58 = add nsw i32 %51, -1
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = sub nuw nsw i32 %16, %58
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %63
  store i8 %61, i8 addrspace(1)* %64, align 1, !tbaa !7
  %65 = add nsw i32 %51, -2
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7
  %69 = sub nuw nsw i32 %16, %65
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %70
  store i8 %68, i8 addrspace(1)* %71, align 1, !tbaa !7
  %72 = add nsw i32 %51, -3
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !7
  %76 = sub nuw nsw i32 %16, %72
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %77
  store i8 %75, i8 addrspace(1)* %78, align 1, !tbaa !7
  %79 = add nsw i32 %51, -4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7
  %83 = sub nuw nsw i32 %16, %79
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %84
  store i8 %82, i8 addrspace(1)* %85, align 1, !tbaa !7
  %86 = add nsw i32 %51, -5
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !7
  %90 = sub nuw nsw i32 %16, %86
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %91
  store i8 %89, i8 addrspace(1)* %92, align 1, !tbaa !7
  %93 = add nsw i32 %51, -6
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7
  %97 = sub nuw nsw i32 %16, %93
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %98
  store i8 %96, i8 addrspace(1)* %99, align 1, !tbaa !7
  %100 = add nsw i32 %51, -7
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %14, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !7
  %104 = sub nuw nsw i32 %16, %100
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %105
  store i8 %103, i8 addrspace(1)* %106, align 1, !tbaa !7
  %107 = add nsw i32 %51, -8
  %108 = icmp sgt i32 %51, 7
  br i1 %108, label %50, label %109, !llvm.loop !14

109:                                              ; preds = %50, %47
  %110 = ptrtoint i8 addrspace(1)* %14 to i64
  tail call fastcc void @__ockl_dm_dealloc(i64 %110) #12
  %111 = zext i32 %26 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %111
  store i8 0, i8 addrspace(1)* %112, align 1, !tbaa !7
  br label %113

113:                                              ; preds = %113, %109
  %114 = phi i32 [ 0, %109 ], [ %119, %113 ]
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %115
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !7
  %118 = icmp eq i8 %117, 0
  %119 = add nuw nsw i32 %114, 1
  br i1 %118, label %120, label %113, !llvm.loop !15

120:                                              ; preds = %113
  %121 = zext i32 %114 to i64
  %122 = addrspacecast i8 addrspace(1)* %31 to i8*
  %123 = icmp eq i32 %114, 0
  br i1 %123, label %138, label %124

124:                                              ; preds = %120
  %125 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7
  %126 = icmp eq i8 %125, 33
  br i1 %126, label %127, label %138

127:                                              ; preds = %124, %130
  %128 = phi i32 [ %135, %130 ], [ 1, %124 ]
  %129 = icmp eq i32 %128, %114
  br i1 %129, label %136, label %130, !llvm.loop !16

130:                                              ; preds = %127
  %131 = zext i32 %128 to i64
  %132 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %131
  %133 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !7
  %134 = icmp eq i8 %133, 33
  %135 = add nuw nsw i32 %128, 1
  br i1 %134, label %127, label %136, !llvm.loop !16

136:                                              ; preds = %130, %127
  %137 = icmp ult i32 %128, %114
  br label %138

138:                                              ; preds = %136, %124, %120
  %139 = phi i1 [ false, %120 ], [ true, %124 ], [ %137, %136 ]
  %140 = urem i64 %13, 1000000000
  %141 = icmp eq i64 %140, 0
  br i1 %141, label %142, label %602

142:                                              ; preds = %138
  %143 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %143, i64 24
  %145 = bitcast i8 addrspace(4)* %144 to i64 addrspace(4)*
  %146 = load i64, i64 addrspace(4)* %145, align 8, !tbaa !17
  %147 = inttoptr i64 %146 to i8 addrspace(1)*
  %148 = addrspacecast i8 addrspace(1)* %147 to i8*
  %149 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %148, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %150 = extractelement <2 x i64> %149, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %151, label %155

151:                                              ; preds = %142
  %152 = and i64 %150, -225
  %153 = or i64 %152, 32
  %154 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %148, i32 noundef 2, i64 noundef %153, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %596

155:                                              ; preds = %142
  %156 = and i64 %150, 2
  %157 = and i64 %150, -3
  %158 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %157, i64 0
  br label %159

159:                                              ; preds = %585, %155
  %160 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 17) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([18 x i8]* addrspacecast ([18 x i8] addrspace(4)* @.str to [18 x i8]*) to i64)), i64 1))), %155 ], [ %593, %585 ]
  %161 = phi i8 addrspace(4)* [ getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0), %155 ], [ %594, %585 ]
  %162 = phi <2 x i64> [ %158, %155 ], [ %592, %585 ]
  %163 = icmp ugt i64 %160, 56
  %164 = extractelement <2 x i64> %162, i64 0
  %165 = or i64 %164, %156
  %166 = insertelement <2 x i64> poison, i64 %165, i64 0
  %167 = select i1 %163, <2 x i64> %162, <2 x i64> %166
  %168 = tail call i64 @llvm.umin.i64(i64 %160, i64 56)
  %169 = trunc i64 %168 to i32
  %170 = extractelement <2 x i64> %167, i64 0
  %171 = icmp ugt i32 %169, 7
  br i1 %171, label %174, label %172

172:                                              ; preds = %159
  %173 = icmp eq i32 %169, 0
  br i1 %173, label %227, label %214

174:                                              ; preds = %159
  %175 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !21
  %176 = zext i8 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 1
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !21
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 8
  %181 = or i64 %180, %176
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 2
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !21
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 16
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 3
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !21
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 24
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 4
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !21
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 32
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 5
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !21
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 40
  %201 = or i64 %196, %200
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 6
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !21
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 48
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 7
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !21
  %209 = zext i8 %208 to i64
  %210 = shl nuw i64 %209, 56
  %211 = or i64 %206, %210
  %212 = add nsw i32 %169, -8
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 8
  br label %227

214:                                              ; preds = %172, %214
  %215 = phi i32 [ %225, %214 ], [ 0, %172 ]
  %216 = phi i64 [ %224, %214 ], [ 0, %172 ]
  %217 = zext i32 %215 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 %217
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !21
  %220 = zext i8 %219 to i64
  %221 = shl i32 %215, 3
  %222 = zext i32 %221 to i64
  %223 = shl nuw i64 %220, %222
  %224 = or i64 %223, %216
  %225 = add nuw nsw i32 %215, 1
  %226 = icmp eq i32 %225, %169
  br i1 %226, label %227, label %214, !llvm.loop !22

227:                                              ; preds = %214, %174, %172
  %228 = phi i8 addrspace(4)* [ %213, %174 ], [ %161, %172 ], [ %161, %214 ]
  %229 = phi i32 [ %212, %174 ], [ 0, %172 ], [ 0, %214 ]
  %230 = phi i64 [ %211, %174 ], [ 0, %172 ], [ %224, %214 ]
  %231 = icmp ugt i32 %229, 7
  br i1 %231, label %234, label %232

232:                                              ; preds = %227
  %233 = icmp eq i32 %229, 0
  br i1 %233, label %287, label %274

234:                                              ; preds = %227
  %235 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !21
  %236 = zext i8 %235 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 1
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !21
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 8
  %241 = or i64 %240, %236
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 2
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !21
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 16
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 3
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !21
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 24
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 4
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !21
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 32
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 5
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !21
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 40
  %261 = or i64 %256, %260
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 6
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !21
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 48
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 7
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !21
  %269 = zext i8 %268 to i64
  %270 = shl nuw i64 %269, 56
  %271 = or i64 %266, %270
  %272 = add nsw i32 %229, -8
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 8
  br label %287

274:                                              ; preds = %232, %274
  %275 = phi i32 [ %285, %274 ], [ 0, %232 ]
  %276 = phi i64 [ %284, %274 ], [ 0, %232 ]
  %277 = zext i32 %275 to i64
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 %277
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !21
  %280 = zext i8 %279 to i64
  %281 = shl i32 %275, 3
  %282 = zext i32 %281 to i64
  %283 = shl nuw i64 %280, %282
  %284 = or i64 %283, %276
  %285 = add nuw nsw i32 %275, 1
  %286 = icmp eq i32 %285, %229
  br i1 %286, label %287, label %274

287:                                              ; preds = %274, %234, %232
  %288 = phi i8 addrspace(4)* [ %273, %234 ], [ %228, %232 ], [ %228, %274 ]
  %289 = phi i32 [ %272, %234 ], [ 0, %232 ], [ 0, %274 ]
  %290 = phi i64 [ %271, %234 ], [ 0, %232 ], [ %284, %274 ]
  %291 = icmp ugt i32 %289, 7
  br i1 %291, label %294, label %292

292:                                              ; preds = %287
  %293 = icmp eq i32 %289, 0
  br i1 %293, label %347, label %334

294:                                              ; preds = %287
  %295 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !21
  %296 = zext i8 %295 to i64
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 1
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !21
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 8
  %301 = or i64 %300, %296
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 2
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !21
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 16
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 3
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !21
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 24
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 4
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !21
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 32
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 5
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !21
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 40
  %321 = or i64 %316, %320
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 6
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !21
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 48
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 7
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !21
  %329 = zext i8 %328 to i64
  %330 = shl nuw i64 %329, 56
  %331 = or i64 %326, %330
  %332 = add nsw i32 %289, -8
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 8
  br label %347

334:                                              ; preds = %292, %334
  %335 = phi i32 [ %345, %334 ], [ 0, %292 ]
  %336 = phi i64 [ %344, %334 ], [ 0, %292 ]
  %337 = zext i32 %335 to i64
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 %337
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !21
  %340 = zext i8 %339 to i64
  %341 = shl i32 %335, 3
  %342 = zext i32 %341 to i64
  %343 = shl nuw i64 %340, %342
  %344 = or i64 %343, %336
  %345 = add nuw nsw i32 %335, 1
  %346 = icmp eq i32 %345, %289
  br i1 %346, label %347, label %334

347:                                              ; preds = %334, %294, %292
  %348 = phi i8 addrspace(4)* [ %333, %294 ], [ %288, %292 ], [ %288, %334 ]
  %349 = phi i32 [ %332, %294 ], [ 0, %292 ], [ 0, %334 ]
  %350 = phi i64 [ %331, %294 ], [ 0, %292 ], [ %344, %334 ]
  %351 = icmp ugt i32 %349, 7
  br i1 %351, label %354, label %352

352:                                              ; preds = %347
  %353 = icmp eq i32 %349, 0
  br i1 %353, label %407, label %394

354:                                              ; preds = %347
  %355 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !21
  %356 = zext i8 %355 to i64
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 1
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !21
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 8
  %361 = or i64 %360, %356
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 2
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !21
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 16
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 3
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !21
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 24
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 4
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !21
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 32
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 5
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !21
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 40
  %381 = or i64 %376, %380
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 6
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !21
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 48
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 7
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !21
  %389 = zext i8 %388 to i64
  %390 = shl nuw i64 %389, 56
  %391 = or i64 %386, %390
  %392 = add nsw i32 %349, -8
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 8
  br label %407

394:                                              ; preds = %352, %394
  %395 = phi i32 [ %405, %394 ], [ 0, %352 ]
  %396 = phi i64 [ %404, %394 ], [ 0, %352 ]
  %397 = zext i32 %395 to i64
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 %397
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !21
  %400 = zext i8 %399 to i64
  %401 = shl i32 %395, 3
  %402 = zext i32 %401 to i64
  %403 = shl nuw i64 %400, %402
  %404 = or i64 %403, %396
  %405 = add nuw nsw i32 %395, 1
  %406 = icmp eq i32 %405, %349
  br i1 %406, label %407, label %394

407:                                              ; preds = %394, %354, %352
  %408 = phi i8 addrspace(4)* [ %393, %354 ], [ %348, %352 ], [ %348, %394 ]
  %409 = phi i32 [ %392, %354 ], [ 0, %352 ], [ 0, %394 ]
  %410 = phi i64 [ %391, %354 ], [ 0, %352 ], [ %404, %394 ]
  %411 = icmp ugt i32 %409, 7
  br i1 %411, label %414, label %412

412:                                              ; preds = %407
  %413 = icmp eq i32 %409, 0
  br i1 %413, label %467, label %454

414:                                              ; preds = %407
  %415 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !21
  %416 = zext i8 %415 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 1
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !21
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 8
  %421 = or i64 %420, %416
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 2
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !21
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 16
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 3
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !21
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 24
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 4
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !21
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 32
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 5
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !21
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 40
  %441 = or i64 %436, %440
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 6
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !21
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 48
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 7
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !21
  %449 = zext i8 %448 to i64
  %450 = shl nuw i64 %449, 56
  %451 = or i64 %446, %450
  %452 = add nsw i32 %409, -8
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 8
  br label %467

454:                                              ; preds = %412, %454
  %455 = phi i32 [ %465, %454 ], [ 0, %412 ]
  %456 = phi i64 [ %464, %454 ], [ 0, %412 ]
  %457 = zext i32 %455 to i64
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 %457
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !21
  %460 = zext i8 %459 to i64
  %461 = shl i32 %455, 3
  %462 = zext i32 %461 to i64
  %463 = shl nuw i64 %460, %462
  %464 = or i64 %463, %456
  %465 = add nuw nsw i32 %455, 1
  %466 = icmp eq i32 %465, %409
  br i1 %466, label %467, label %454

467:                                              ; preds = %454, %414, %412
  %468 = phi i8 addrspace(4)* [ %453, %414 ], [ %408, %412 ], [ %408, %454 ]
  %469 = phi i32 [ %452, %414 ], [ 0, %412 ], [ 0, %454 ]
  %470 = phi i64 [ %451, %414 ], [ 0, %412 ], [ %464, %454 ]
  %471 = icmp ugt i32 %469, 7
  br i1 %471, label %474, label %472

472:                                              ; preds = %467
  %473 = icmp eq i32 %469, 0
  br i1 %473, label %527, label %514

474:                                              ; preds = %467
  %475 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !21
  %476 = zext i8 %475 to i64
  %477 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 1
  %478 = load i8, i8 addrspace(4)* %477, align 1, !tbaa !21
  %479 = zext i8 %478 to i64
  %480 = shl nuw nsw i64 %479, 8
  %481 = or i64 %480, %476
  %482 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 2
  %483 = load i8, i8 addrspace(4)* %482, align 1, !tbaa !21
  %484 = zext i8 %483 to i64
  %485 = shl nuw nsw i64 %484, 16
  %486 = or i64 %481, %485
  %487 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 3
  %488 = load i8, i8 addrspace(4)* %487, align 1, !tbaa !21
  %489 = zext i8 %488 to i64
  %490 = shl nuw nsw i64 %489, 24
  %491 = or i64 %486, %490
  %492 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 4
  %493 = load i8, i8 addrspace(4)* %492, align 1, !tbaa !21
  %494 = zext i8 %493 to i64
  %495 = shl nuw nsw i64 %494, 32
  %496 = or i64 %491, %495
  %497 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 5
  %498 = load i8, i8 addrspace(4)* %497, align 1, !tbaa !21
  %499 = zext i8 %498 to i64
  %500 = shl nuw nsw i64 %499, 40
  %501 = or i64 %496, %500
  %502 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 6
  %503 = load i8, i8 addrspace(4)* %502, align 1, !tbaa !21
  %504 = zext i8 %503 to i64
  %505 = shl nuw nsw i64 %504, 48
  %506 = or i64 %501, %505
  %507 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 7
  %508 = load i8, i8 addrspace(4)* %507, align 1, !tbaa !21
  %509 = zext i8 %508 to i64
  %510 = shl nuw i64 %509, 56
  %511 = or i64 %506, %510
  %512 = add nsw i32 %469, -8
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 8
  br label %527

514:                                              ; preds = %472, %514
  %515 = phi i32 [ %525, %514 ], [ 0, %472 ]
  %516 = phi i64 [ %524, %514 ], [ 0, %472 ]
  %517 = zext i32 %515 to i64
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 %517
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !21
  %520 = zext i8 %519 to i64
  %521 = shl i32 %515, 3
  %522 = zext i32 %521 to i64
  %523 = shl nuw i64 %520, %522
  %524 = or i64 %523, %516
  %525 = add nuw nsw i32 %515, 1
  %526 = icmp eq i32 %525, %469
  br i1 %526, label %527, label %514

527:                                              ; preds = %514, %474, %472
  %528 = phi i8 addrspace(4)* [ %513, %474 ], [ %468, %472 ], [ %468, %514 ]
  %529 = phi i32 [ %512, %474 ], [ 0, %472 ], [ 0, %514 ]
  %530 = phi i64 [ %511, %474 ], [ 0, %472 ], [ %524, %514 ]
  %531 = icmp ugt i32 %529, 7
  br i1 %531, label %534, label %532

532:                                              ; preds = %527
  %533 = icmp eq i32 %529, 0
  br i1 %533, label %585, label %572

534:                                              ; preds = %527
  %535 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !21
  %536 = zext i8 %535 to i64
  %537 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 1
  %538 = load i8, i8 addrspace(4)* %537, align 1, !tbaa !21
  %539 = zext i8 %538 to i64
  %540 = shl nuw nsw i64 %539, 8
  %541 = or i64 %540, %536
  %542 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 2
  %543 = load i8, i8 addrspace(4)* %542, align 1, !tbaa !21
  %544 = zext i8 %543 to i64
  %545 = shl nuw nsw i64 %544, 16
  %546 = or i64 %541, %545
  %547 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 3
  %548 = load i8, i8 addrspace(4)* %547, align 1, !tbaa !21
  %549 = zext i8 %548 to i64
  %550 = shl nuw nsw i64 %549, 24
  %551 = or i64 %546, %550
  %552 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 4
  %553 = load i8, i8 addrspace(4)* %552, align 1, !tbaa !21
  %554 = zext i8 %553 to i64
  %555 = shl nuw nsw i64 %554, 32
  %556 = or i64 %551, %555
  %557 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 5
  %558 = load i8, i8 addrspace(4)* %557, align 1, !tbaa !21
  %559 = zext i8 %558 to i64
  %560 = shl nuw nsw i64 %559, 40
  %561 = or i64 %556, %560
  %562 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 6
  %563 = load i8, i8 addrspace(4)* %562, align 1, !tbaa !21
  %564 = zext i8 %563 to i64
  %565 = shl nuw nsw i64 %564, 48
  %566 = or i64 %561, %565
  %567 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 7
  %568 = load i8, i8 addrspace(4)* %567, align 1, !tbaa !21
  %569 = zext i8 %568 to i64
  %570 = shl nuw i64 %569, 56
  %571 = or i64 %566, %570
  br label %585

572:                                              ; preds = %532, %572
  %573 = phi i32 [ %583, %572 ], [ 0, %532 ]
  %574 = phi i64 [ %582, %572 ], [ 0, %532 ]
  %575 = zext i32 %573 to i64
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %528, i64 %575
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !21
  %578 = zext i8 %577 to i64
  %579 = shl i32 %573, 3
  %580 = zext i32 %579 to i64
  %581 = shl nuw i64 %578, %580
  %582 = or i64 %581, %574
  %583 = add nuw nsw i32 %573, 1
  %584 = icmp eq i32 %583, %529
  br i1 %584, label %585, label %572

585:                                              ; preds = %572, %534, %532
  %586 = phi i64 [ %571, %534 ], [ 0, %532 ], [ %582, %572 ]
  %587 = shl nuw nsw i64 %168, 2
  %588 = add nuw nsw i64 %587, 28
  %589 = and i64 %588, 480
  %590 = and i64 %170, -225
  %591 = or i64 %590, %589
  %592 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %148, i32 noundef 2, i64 noundef %591, i64 noundef %230, i64 noundef %290, i64 noundef %350, i64 noundef %410, i64 noundef %470, i64 noundef %530, i64 noundef %586) #12
  %593 = sub i64 %160, %168
  %594 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 %168
  %595 = icmp eq i64 %593, 0
  br i1 %595, label %596, label %159

596:                                              ; preds = %585, %151
  %597 = phi <2 x i64> [ %154, %151 ], [ %592, %585 ]
  %598 = extractelement <2 x i64> %597, i64 0
  %599 = and i64 %598, -227
  %600 = or i64 %599, 34
  %601 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %148, i32 noundef 2, i64 noundef %600, i64 noundef %13, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %602

602:                                              ; preds = %596, %138
  br i1 %139, label %1526, label %603

603:                                              ; preds = %602
  %604 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %605 = getelementptr inbounds i8, i8 addrspace(4)* %604, i64 24
  %606 = bitcast i8 addrspace(4)* %605 to i64 addrspace(4)*
  %607 = load i64, i64 addrspace(4)* %606, align 8, !tbaa !17
  %608 = inttoptr i64 %607 to i8 addrspace(1)*
  %609 = addrspacecast i8 addrspace(1)* %608 to i8*
  %610 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %611 = extractelement <2 x i64> %610, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %612, label %616

612:                                              ; preds = %603
  %613 = and i64 %611, -225
  %614 = or i64 %613, 32
  %615 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef %614, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1057

616:                                              ; preds = %603
  %617 = and i64 %611, 2
  %618 = and i64 %611, -3
  %619 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %618, i64 0
  br label %620

620:                                              ; preds = %1046, %616
  %621 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 34) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([35 x i8]* addrspacecast ([35 x i8] addrspace(4)* @.str.1 to [35 x i8]*) to i64)), i64 1))), %616 ], [ %1054, %1046 ]
  %622 = phi i8 addrspace(4)* [ getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %616 ], [ %1055, %1046 ]
  %623 = phi <2 x i64> [ %619, %616 ], [ %1053, %1046 ]
  %624 = icmp ugt i64 %621, 56
  %625 = extractelement <2 x i64> %623, i64 0
  %626 = or i64 %625, %617
  %627 = insertelement <2 x i64> poison, i64 %626, i64 0
  %628 = select i1 %624, <2 x i64> %623, <2 x i64> %627
  %629 = tail call i64 @llvm.umin.i64(i64 %621, i64 56)
  %630 = trunc i64 %629 to i32
  %631 = extractelement <2 x i64> %628, i64 0
  %632 = icmp ugt i32 %630, 7
  br i1 %632, label %635, label %633

633:                                              ; preds = %620
  %634 = icmp eq i32 %630, 0
  br i1 %634, label %688, label %675

635:                                              ; preds = %620
  %636 = load i8, i8 addrspace(4)* %622, align 1, !tbaa !21
  %637 = zext i8 %636 to i64
  %638 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 1
  %639 = load i8, i8 addrspace(4)* %638, align 1, !tbaa !21
  %640 = zext i8 %639 to i64
  %641 = shl nuw nsw i64 %640, 8
  %642 = or i64 %641, %637
  %643 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 2
  %644 = load i8, i8 addrspace(4)* %643, align 1, !tbaa !21
  %645 = zext i8 %644 to i64
  %646 = shl nuw nsw i64 %645, 16
  %647 = or i64 %642, %646
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 3
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !21
  %650 = zext i8 %649 to i64
  %651 = shl nuw nsw i64 %650, 24
  %652 = or i64 %647, %651
  %653 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 4
  %654 = load i8, i8 addrspace(4)* %653, align 1, !tbaa !21
  %655 = zext i8 %654 to i64
  %656 = shl nuw nsw i64 %655, 32
  %657 = or i64 %652, %656
  %658 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 5
  %659 = load i8, i8 addrspace(4)* %658, align 1, !tbaa !21
  %660 = zext i8 %659 to i64
  %661 = shl nuw nsw i64 %660, 40
  %662 = or i64 %657, %661
  %663 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 6
  %664 = load i8, i8 addrspace(4)* %663, align 1, !tbaa !21
  %665 = zext i8 %664 to i64
  %666 = shl nuw nsw i64 %665, 48
  %667 = or i64 %662, %666
  %668 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 7
  %669 = load i8, i8 addrspace(4)* %668, align 1, !tbaa !21
  %670 = zext i8 %669 to i64
  %671 = shl nuw i64 %670, 56
  %672 = or i64 %667, %671
  %673 = add nsw i32 %630, -8
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 8
  br label %688

675:                                              ; preds = %633, %675
  %676 = phi i32 [ %686, %675 ], [ 0, %633 ]
  %677 = phi i64 [ %685, %675 ], [ 0, %633 ]
  %678 = zext i32 %676 to i64
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 %678
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !21
  %681 = zext i8 %680 to i64
  %682 = shl i32 %676, 3
  %683 = zext i32 %682 to i64
  %684 = shl nuw i64 %681, %683
  %685 = or i64 %684, %677
  %686 = add nuw nsw i32 %676, 1
  %687 = icmp eq i32 %686, %630
  br i1 %687, label %688, label %675, !llvm.loop !22

688:                                              ; preds = %675, %635, %633
  %689 = phi i8 addrspace(4)* [ %674, %635 ], [ %622, %633 ], [ %622, %675 ]
  %690 = phi i32 [ %673, %635 ], [ 0, %633 ], [ 0, %675 ]
  %691 = phi i64 [ %672, %635 ], [ 0, %633 ], [ %685, %675 ]
  %692 = icmp ugt i32 %690, 7
  br i1 %692, label %695, label %693

693:                                              ; preds = %688
  %694 = icmp eq i32 %690, 0
  br i1 %694, label %748, label %735

695:                                              ; preds = %688
  %696 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !21
  %697 = zext i8 %696 to i64
  %698 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 1
  %699 = load i8, i8 addrspace(4)* %698, align 1, !tbaa !21
  %700 = zext i8 %699 to i64
  %701 = shl nuw nsw i64 %700, 8
  %702 = or i64 %701, %697
  %703 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 2
  %704 = load i8, i8 addrspace(4)* %703, align 1, !tbaa !21
  %705 = zext i8 %704 to i64
  %706 = shl nuw nsw i64 %705, 16
  %707 = or i64 %702, %706
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 3
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !21
  %710 = zext i8 %709 to i64
  %711 = shl nuw nsw i64 %710, 24
  %712 = or i64 %707, %711
  %713 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 4
  %714 = load i8, i8 addrspace(4)* %713, align 1, !tbaa !21
  %715 = zext i8 %714 to i64
  %716 = shl nuw nsw i64 %715, 32
  %717 = or i64 %712, %716
  %718 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 5
  %719 = load i8, i8 addrspace(4)* %718, align 1, !tbaa !21
  %720 = zext i8 %719 to i64
  %721 = shl nuw nsw i64 %720, 40
  %722 = or i64 %717, %721
  %723 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 6
  %724 = load i8, i8 addrspace(4)* %723, align 1, !tbaa !21
  %725 = zext i8 %724 to i64
  %726 = shl nuw nsw i64 %725, 48
  %727 = or i64 %722, %726
  %728 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 7
  %729 = load i8, i8 addrspace(4)* %728, align 1, !tbaa !21
  %730 = zext i8 %729 to i64
  %731 = shl nuw i64 %730, 56
  %732 = or i64 %727, %731
  %733 = add nsw i32 %690, -8
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 8
  br label %748

735:                                              ; preds = %693, %735
  %736 = phi i32 [ %746, %735 ], [ 0, %693 ]
  %737 = phi i64 [ %745, %735 ], [ 0, %693 ]
  %738 = zext i32 %736 to i64
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %689, i64 %738
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !21
  %741 = zext i8 %740 to i64
  %742 = shl i32 %736, 3
  %743 = zext i32 %742 to i64
  %744 = shl nuw i64 %741, %743
  %745 = or i64 %744, %737
  %746 = add nuw nsw i32 %736, 1
  %747 = icmp eq i32 %746, %690
  br i1 %747, label %748, label %735

748:                                              ; preds = %735, %695, %693
  %749 = phi i8 addrspace(4)* [ %734, %695 ], [ %689, %693 ], [ %689, %735 ]
  %750 = phi i32 [ %733, %695 ], [ 0, %693 ], [ 0, %735 ]
  %751 = phi i64 [ %732, %695 ], [ 0, %693 ], [ %745, %735 ]
  %752 = icmp ugt i32 %750, 7
  br i1 %752, label %755, label %753

753:                                              ; preds = %748
  %754 = icmp eq i32 %750, 0
  br i1 %754, label %808, label %795

755:                                              ; preds = %748
  %756 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !21
  %757 = zext i8 %756 to i64
  %758 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 1
  %759 = load i8, i8 addrspace(4)* %758, align 1, !tbaa !21
  %760 = zext i8 %759 to i64
  %761 = shl nuw nsw i64 %760, 8
  %762 = or i64 %761, %757
  %763 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 2
  %764 = load i8, i8 addrspace(4)* %763, align 1, !tbaa !21
  %765 = zext i8 %764 to i64
  %766 = shl nuw nsw i64 %765, 16
  %767 = or i64 %762, %766
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 3
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !21
  %770 = zext i8 %769 to i64
  %771 = shl nuw nsw i64 %770, 24
  %772 = or i64 %767, %771
  %773 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 4
  %774 = load i8, i8 addrspace(4)* %773, align 1, !tbaa !21
  %775 = zext i8 %774 to i64
  %776 = shl nuw nsw i64 %775, 32
  %777 = or i64 %772, %776
  %778 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 5
  %779 = load i8, i8 addrspace(4)* %778, align 1, !tbaa !21
  %780 = zext i8 %779 to i64
  %781 = shl nuw nsw i64 %780, 40
  %782 = or i64 %777, %781
  %783 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 6
  %784 = load i8, i8 addrspace(4)* %783, align 1, !tbaa !21
  %785 = zext i8 %784 to i64
  %786 = shl nuw nsw i64 %785, 48
  %787 = or i64 %782, %786
  %788 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 7
  %789 = load i8, i8 addrspace(4)* %788, align 1, !tbaa !21
  %790 = zext i8 %789 to i64
  %791 = shl nuw i64 %790, 56
  %792 = or i64 %787, %791
  %793 = add nsw i32 %750, -8
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 8
  br label %808

795:                                              ; preds = %753, %795
  %796 = phi i32 [ %806, %795 ], [ 0, %753 ]
  %797 = phi i64 [ %805, %795 ], [ 0, %753 ]
  %798 = zext i32 %796 to i64
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %749, i64 %798
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !21
  %801 = zext i8 %800 to i64
  %802 = shl i32 %796, 3
  %803 = zext i32 %802 to i64
  %804 = shl nuw i64 %801, %803
  %805 = or i64 %804, %797
  %806 = add nuw nsw i32 %796, 1
  %807 = icmp eq i32 %806, %750
  br i1 %807, label %808, label %795

808:                                              ; preds = %795, %755, %753
  %809 = phi i8 addrspace(4)* [ %794, %755 ], [ %749, %753 ], [ %749, %795 ]
  %810 = phi i32 [ %793, %755 ], [ 0, %753 ], [ 0, %795 ]
  %811 = phi i64 [ %792, %755 ], [ 0, %753 ], [ %805, %795 ]
  %812 = icmp ugt i32 %810, 7
  br i1 %812, label %815, label %813

813:                                              ; preds = %808
  %814 = icmp eq i32 %810, 0
  br i1 %814, label %868, label %855

815:                                              ; preds = %808
  %816 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !21
  %817 = zext i8 %816 to i64
  %818 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 1
  %819 = load i8, i8 addrspace(4)* %818, align 1, !tbaa !21
  %820 = zext i8 %819 to i64
  %821 = shl nuw nsw i64 %820, 8
  %822 = or i64 %821, %817
  %823 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 2
  %824 = load i8, i8 addrspace(4)* %823, align 1, !tbaa !21
  %825 = zext i8 %824 to i64
  %826 = shl nuw nsw i64 %825, 16
  %827 = or i64 %822, %826
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 3
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !21
  %830 = zext i8 %829 to i64
  %831 = shl nuw nsw i64 %830, 24
  %832 = or i64 %827, %831
  %833 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 4
  %834 = load i8, i8 addrspace(4)* %833, align 1, !tbaa !21
  %835 = zext i8 %834 to i64
  %836 = shl nuw nsw i64 %835, 32
  %837 = or i64 %832, %836
  %838 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 5
  %839 = load i8, i8 addrspace(4)* %838, align 1, !tbaa !21
  %840 = zext i8 %839 to i64
  %841 = shl nuw nsw i64 %840, 40
  %842 = or i64 %837, %841
  %843 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 6
  %844 = load i8, i8 addrspace(4)* %843, align 1, !tbaa !21
  %845 = zext i8 %844 to i64
  %846 = shl nuw nsw i64 %845, 48
  %847 = or i64 %842, %846
  %848 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 7
  %849 = load i8, i8 addrspace(4)* %848, align 1, !tbaa !21
  %850 = zext i8 %849 to i64
  %851 = shl nuw i64 %850, 56
  %852 = or i64 %847, %851
  %853 = add nsw i32 %810, -8
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 8
  br label %868

855:                                              ; preds = %813, %855
  %856 = phi i32 [ %866, %855 ], [ 0, %813 ]
  %857 = phi i64 [ %865, %855 ], [ 0, %813 ]
  %858 = zext i32 %856 to i64
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %809, i64 %858
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !21
  %861 = zext i8 %860 to i64
  %862 = shl i32 %856, 3
  %863 = zext i32 %862 to i64
  %864 = shl nuw i64 %861, %863
  %865 = or i64 %864, %857
  %866 = add nuw nsw i32 %856, 1
  %867 = icmp eq i32 %866, %810
  br i1 %867, label %868, label %855

868:                                              ; preds = %855, %815, %813
  %869 = phi i8 addrspace(4)* [ %854, %815 ], [ %809, %813 ], [ %809, %855 ]
  %870 = phi i32 [ %853, %815 ], [ 0, %813 ], [ 0, %855 ]
  %871 = phi i64 [ %852, %815 ], [ 0, %813 ], [ %865, %855 ]
  %872 = icmp ugt i32 %870, 7
  br i1 %872, label %875, label %873

873:                                              ; preds = %868
  %874 = icmp eq i32 %870, 0
  br i1 %874, label %928, label %915

875:                                              ; preds = %868
  %876 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !21
  %877 = zext i8 %876 to i64
  %878 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 1
  %879 = load i8, i8 addrspace(4)* %878, align 1, !tbaa !21
  %880 = zext i8 %879 to i64
  %881 = shl nuw nsw i64 %880, 8
  %882 = or i64 %881, %877
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 2
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !21
  %885 = zext i8 %884 to i64
  %886 = shl nuw nsw i64 %885, 16
  %887 = or i64 %882, %886
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 3
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !21
  %890 = zext i8 %889 to i64
  %891 = shl nuw nsw i64 %890, 24
  %892 = or i64 %887, %891
  %893 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 4
  %894 = load i8, i8 addrspace(4)* %893, align 1, !tbaa !21
  %895 = zext i8 %894 to i64
  %896 = shl nuw nsw i64 %895, 32
  %897 = or i64 %892, %896
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 5
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !21
  %900 = zext i8 %899 to i64
  %901 = shl nuw nsw i64 %900, 40
  %902 = or i64 %897, %901
  %903 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 6
  %904 = load i8, i8 addrspace(4)* %903, align 1, !tbaa !21
  %905 = zext i8 %904 to i64
  %906 = shl nuw nsw i64 %905, 48
  %907 = or i64 %902, %906
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 7
  %909 = load i8, i8 addrspace(4)* %908, align 1, !tbaa !21
  %910 = zext i8 %909 to i64
  %911 = shl nuw i64 %910, 56
  %912 = or i64 %907, %911
  %913 = add nsw i32 %870, -8
  %914 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 8
  br label %928

915:                                              ; preds = %873, %915
  %916 = phi i32 [ %926, %915 ], [ 0, %873 ]
  %917 = phi i64 [ %925, %915 ], [ 0, %873 ]
  %918 = zext i32 %916 to i64
  %919 = getelementptr inbounds i8, i8 addrspace(4)* %869, i64 %918
  %920 = load i8, i8 addrspace(4)* %919, align 1, !tbaa !21
  %921 = zext i8 %920 to i64
  %922 = shl i32 %916, 3
  %923 = zext i32 %922 to i64
  %924 = shl nuw i64 %921, %923
  %925 = or i64 %924, %917
  %926 = add nuw nsw i32 %916, 1
  %927 = icmp eq i32 %926, %870
  br i1 %927, label %928, label %915

928:                                              ; preds = %915, %875, %873
  %929 = phi i8 addrspace(4)* [ %914, %875 ], [ %869, %873 ], [ %869, %915 ]
  %930 = phi i32 [ %913, %875 ], [ 0, %873 ], [ 0, %915 ]
  %931 = phi i64 [ %912, %875 ], [ 0, %873 ], [ %925, %915 ]
  %932 = icmp ugt i32 %930, 7
  br i1 %932, label %935, label %933

933:                                              ; preds = %928
  %934 = icmp eq i32 %930, 0
  br i1 %934, label %988, label %975

935:                                              ; preds = %928
  %936 = load i8, i8 addrspace(4)* %929, align 1, !tbaa !21
  %937 = zext i8 %936 to i64
  %938 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 1
  %939 = load i8, i8 addrspace(4)* %938, align 1, !tbaa !21
  %940 = zext i8 %939 to i64
  %941 = shl nuw nsw i64 %940, 8
  %942 = or i64 %941, %937
  %943 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 2
  %944 = load i8, i8 addrspace(4)* %943, align 1, !tbaa !21
  %945 = zext i8 %944 to i64
  %946 = shl nuw nsw i64 %945, 16
  %947 = or i64 %942, %946
  %948 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 3
  %949 = load i8, i8 addrspace(4)* %948, align 1, !tbaa !21
  %950 = zext i8 %949 to i64
  %951 = shl nuw nsw i64 %950, 24
  %952 = or i64 %947, %951
  %953 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 4
  %954 = load i8, i8 addrspace(4)* %953, align 1, !tbaa !21
  %955 = zext i8 %954 to i64
  %956 = shl nuw nsw i64 %955, 32
  %957 = or i64 %952, %956
  %958 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 5
  %959 = load i8, i8 addrspace(4)* %958, align 1, !tbaa !21
  %960 = zext i8 %959 to i64
  %961 = shl nuw nsw i64 %960, 40
  %962 = or i64 %957, %961
  %963 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 6
  %964 = load i8, i8 addrspace(4)* %963, align 1, !tbaa !21
  %965 = zext i8 %964 to i64
  %966 = shl nuw nsw i64 %965, 48
  %967 = or i64 %962, %966
  %968 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 7
  %969 = load i8, i8 addrspace(4)* %968, align 1, !tbaa !21
  %970 = zext i8 %969 to i64
  %971 = shl nuw i64 %970, 56
  %972 = or i64 %967, %971
  %973 = add nsw i32 %930, -8
  %974 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 8
  br label %988

975:                                              ; preds = %933, %975
  %976 = phi i32 [ %986, %975 ], [ 0, %933 ]
  %977 = phi i64 [ %985, %975 ], [ 0, %933 ]
  %978 = zext i32 %976 to i64
  %979 = getelementptr inbounds i8, i8 addrspace(4)* %929, i64 %978
  %980 = load i8, i8 addrspace(4)* %979, align 1, !tbaa !21
  %981 = zext i8 %980 to i64
  %982 = shl i32 %976, 3
  %983 = zext i32 %982 to i64
  %984 = shl nuw i64 %981, %983
  %985 = or i64 %984, %977
  %986 = add nuw nsw i32 %976, 1
  %987 = icmp eq i32 %986, %930
  br i1 %987, label %988, label %975

988:                                              ; preds = %975, %935, %933
  %989 = phi i8 addrspace(4)* [ %974, %935 ], [ %929, %933 ], [ %929, %975 ]
  %990 = phi i32 [ %973, %935 ], [ 0, %933 ], [ 0, %975 ]
  %991 = phi i64 [ %972, %935 ], [ 0, %933 ], [ %985, %975 ]
  %992 = icmp ugt i32 %990, 7
  br i1 %992, label %995, label %993

993:                                              ; preds = %988
  %994 = icmp eq i32 %990, 0
  br i1 %994, label %1046, label %1033

995:                                              ; preds = %988
  %996 = load i8, i8 addrspace(4)* %989, align 1, !tbaa !21
  %997 = zext i8 %996 to i64
  %998 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 1
  %999 = load i8, i8 addrspace(4)* %998, align 1, !tbaa !21
  %1000 = zext i8 %999 to i64
  %1001 = shl nuw nsw i64 %1000, 8
  %1002 = or i64 %1001, %997
  %1003 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 2
  %1004 = load i8, i8 addrspace(4)* %1003, align 1, !tbaa !21
  %1005 = zext i8 %1004 to i64
  %1006 = shl nuw nsw i64 %1005, 16
  %1007 = or i64 %1002, %1006
  %1008 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 3
  %1009 = load i8, i8 addrspace(4)* %1008, align 1, !tbaa !21
  %1010 = zext i8 %1009 to i64
  %1011 = shl nuw nsw i64 %1010, 24
  %1012 = or i64 %1007, %1011
  %1013 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 4
  %1014 = load i8, i8 addrspace(4)* %1013, align 1, !tbaa !21
  %1015 = zext i8 %1014 to i64
  %1016 = shl nuw nsw i64 %1015, 32
  %1017 = or i64 %1012, %1016
  %1018 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 5
  %1019 = load i8, i8 addrspace(4)* %1018, align 1, !tbaa !21
  %1020 = zext i8 %1019 to i64
  %1021 = shl nuw nsw i64 %1020, 40
  %1022 = or i64 %1017, %1021
  %1023 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 6
  %1024 = load i8, i8 addrspace(4)* %1023, align 1, !tbaa !21
  %1025 = zext i8 %1024 to i64
  %1026 = shl nuw nsw i64 %1025, 48
  %1027 = or i64 %1022, %1026
  %1028 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 7
  %1029 = load i8, i8 addrspace(4)* %1028, align 1, !tbaa !21
  %1030 = zext i8 %1029 to i64
  %1031 = shl nuw i64 %1030, 56
  %1032 = or i64 %1027, %1031
  br label %1046

1033:                                             ; preds = %993, %1033
  %1034 = phi i32 [ %1044, %1033 ], [ 0, %993 ]
  %1035 = phi i64 [ %1043, %1033 ], [ 0, %993 ]
  %1036 = zext i32 %1034 to i64
  %1037 = getelementptr inbounds i8, i8 addrspace(4)* %989, i64 %1036
  %1038 = load i8, i8 addrspace(4)* %1037, align 1, !tbaa !21
  %1039 = zext i8 %1038 to i64
  %1040 = shl i32 %1034, 3
  %1041 = zext i32 %1040 to i64
  %1042 = shl nuw i64 %1039, %1041
  %1043 = or i64 %1042, %1035
  %1044 = add nuw nsw i32 %1034, 1
  %1045 = icmp eq i32 %1044, %990
  br i1 %1045, label %1046, label %1033

1046:                                             ; preds = %1033, %995, %993
  %1047 = phi i64 [ %1032, %995 ], [ 0, %993 ], [ %1043, %1033 ]
  %1048 = shl nuw nsw i64 %629, 2
  %1049 = add nuw nsw i64 %1048, 28
  %1050 = and i64 %1049, 480
  %1051 = and i64 %631, -225
  %1052 = or i64 %1051, %1050
  %1053 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef %1052, i64 noundef %691, i64 noundef %751, i64 noundef %811, i64 noundef %871, i64 noundef %931, i64 noundef %991, i64 noundef %1047) #12
  %1054 = sub i64 %621, %629
  %1055 = getelementptr inbounds i8, i8 addrspace(4)* %622, i64 %629
  %1056 = icmp eq i64 %1054, 0
  br i1 %1056, label %1057, label %620

1057:                                             ; preds = %1046, %612
  %1058 = phi <2 x i64> [ %615, %612 ], [ %1053, %1046 ]
  %1059 = extractelement <2 x i64> %1058, i64 0
  %1060 = and i64 %1059, -225
  %1061 = or i64 %1060, 32
  %1062 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef %1061, i64 noundef %13, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1063 = extractelement <2 x i64> %1062, i64 0
  %1064 = and i64 %1063, -225
  %1065 = or i64 %1064, 32
  %1066 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef %1065, i64 noundef %121, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1067 = extractelement <2 x i64> %1066, i64 0
  %1068 = icmp eq i8 addrspace(1)* %31, addrspacecast (i8* null to i8 addrspace(1)*)
  br i1 %1068, label %1080, label %1069

1069:                                             ; preds = %1057, %1069
  %1070 = phi i8 addrspace(1)* [ %1071, %1069 ], [ %31, %1057 ]
  %1071 = getelementptr i8, i8 addrspace(1)* %1070, i64 1
  %1072 = load i8, i8 addrspace(1)* %1070, align 1
  %1073 = icmp eq i8 %1072, 0
  br i1 %1073, label %1074, label %1069

1074:                                             ; preds = %1069
  %1075 = addrspacecast i8 addrspace(1)* %1070 to i8*
  %1076 = ptrtoint i8* %122 to i64
  %1077 = ptrtoint i8* %1075 to i64
  %1078 = sub i64 %1077, %1076
  %1079 = add i64 %1078, 1
  br label %1080

1080:                                             ; preds = %1074, %1057
  %1081 = phi i64 [ %1079, %1074 ], [ 0, %1057 ]
  br i1 %1068, label %1082, label %1086

1082:                                             ; preds = %1080
  %1083 = and i64 %1067, -227
  %1084 = or i64 %1083, 34
  %1085 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef %1084, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1526

1086:                                             ; preds = %1080
  %1087 = and i64 %1067, -3
  %1088 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1087, i64 0
  br label %1089

1089:                                             ; preds = %1515, %1086
  %1090 = phi i64 [ %1081, %1086 ], [ %1523, %1515 ]
  %1091 = phi i8 addrspace(1)* [ %31, %1086 ], [ %1524, %1515 ]
  %1092 = phi <2 x i64> [ %1088, %1086 ], [ %1522, %1515 ]
  %1093 = icmp ugt i64 %1090, 56
  %1094 = extractelement <2 x i64> %1092, i64 0
  %1095 = or i64 %1094, 2
  %1096 = insertelement <2 x i64> poison, i64 %1095, i64 0
  %1097 = select i1 %1093, <2 x i64> %1092, <2 x i64> %1096
  %1098 = tail call i64 @llvm.umin.i64(i64 %1090, i64 56)
  %1099 = trunc i64 %1098 to i32
  %1100 = extractelement <2 x i64> %1097, i64 0
  %1101 = icmp ugt i32 %1099, 7
  br i1 %1101, label %1104, label %1102

1102:                                             ; preds = %1089
  %1103 = icmp eq i32 %1099, 0
  br i1 %1103, label %1157, label %1144

1104:                                             ; preds = %1089
  %1105 = load i8, i8 addrspace(1)* %1091, align 1, !tbaa !21
  %1106 = zext i8 %1105 to i64
  %1107 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 1
  %1108 = load i8, i8 addrspace(1)* %1107, align 1, !tbaa !21
  %1109 = zext i8 %1108 to i64
  %1110 = shl nuw nsw i64 %1109, 8
  %1111 = or i64 %1110, %1106
  %1112 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 2
  %1113 = load i8, i8 addrspace(1)* %1112, align 1, !tbaa !21
  %1114 = zext i8 %1113 to i64
  %1115 = shl nuw nsw i64 %1114, 16
  %1116 = or i64 %1111, %1115
  %1117 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 3
  %1118 = load i8, i8 addrspace(1)* %1117, align 1, !tbaa !21
  %1119 = zext i8 %1118 to i64
  %1120 = shl nuw nsw i64 %1119, 24
  %1121 = or i64 %1116, %1120
  %1122 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 4
  %1123 = load i8, i8 addrspace(1)* %1122, align 1, !tbaa !21
  %1124 = zext i8 %1123 to i64
  %1125 = shl nuw nsw i64 %1124, 32
  %1126 = or i64 %1121, %1125
  %1127 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 5
  %1128 = load i8, i8 addrspace(1)* %1127, align 1, !tbaa !21
  %1129 = zext i8 %1128 to i64
  %1130 = shl nuw nsw i64 %1129, 40
  %1131 = or i64 %1126, %1130
  %1132 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 6
  %1133 = load i8, i8 addrspace(1)* %1132, align 1, !tbaa !21
  %1134 = zext i8 %1133 to i64
  %1135 = shl nuw nsw i64 %1134, 48
  %1136 = or i64 %1131, %1135
  %1137 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 7
  %1138 = load i8, i8 addrspace(1)* %1137, align 1, !tbaa !21
  %1139 = zext i8 %1138 to i64
  %1140 = shl nuw i64 %1139, 56
  %1141 = or i64 %1136, %1140
  %1142 = add nsw i32 %1099, -8
  %1143 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 8
  br label %1157

1144:                                             ; preds = %1102, %1144
  %1145 = phi i32 [ %1155, %1144 ], [ 0, %1102 ]
  %1146 = phi i64 [ %1154, %1144 ], [ 0, %1102 ]
  %1147 = zext i32 %1145 to i64
  %1148 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 %1147
  %1149 = load i8, i8 addrspace(1)* %1148, align 1, !tbaa !21
  %1150 = zext i8 %1149 to i64
  %1151 = shl i32 %1145, 3
  %1152 = zext i32 %1151 to i64
  %1153 = shl nuw i64 %1150, %1152
  %1154 = or i64 %1153, %1146
  %1155 = add nuw nsw i32 %1145, 1
  %1156 = icmp eq i32 %1155, %1099
  br i1 %1156, label %1157, label %1144, !llvm.loop !22

1157:                                             ; preds = %1144, %1104, %1102
  %1158 = phi i8 addrspace(1)* [ %1143, %1104 ], [ %1091, %1102 ], [ %1091, %1144 ]
  %1159 = phi i32 [ %1142, %1104 ], [ 0, %1102 ], [ 0, %1144 ]
  %1160 = phi i64 [ %1141, %1104 ], [ 0, %1102 ], [ %1154, %1144 ]
  %1161 = icmp ugt i32 %1159, 7
  br i1 %1161, label %1164, label %1162

1162:                                             ; preds = %1157
  %1163 = icmp eq i32 %1159, 0
  br i1 %1163, label %1217, label %1204

1164:                                             ; preds = %1157
  %1165 = load i8, i8 addrspace(1)* %1158, align 1, !tbaa !21
  %1166 = zext i8 %1165 to i64
  %1167 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 1
  %1168 = load i8, i8 addrspace(1)* %1167, align 1, !tbaa !21
  %1169 = zext i8 %1168 to i64
  %1170 = shl nuw nsw i64 %1169, 8
  %1171 = or i64 %1170, %1166
  %1172 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 2
  %1173 = load i8, i8 addrspace(1)* %1172, align 1, !tbaa !21
  %1174 = zext i8 %1173 to i64
  %1175 = shl nuw nsw i64 %1174, 16
  %1176 = or i64 %1171, %1175
  %1177 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 3
  %1178 = load i8, i8 addrspace(1)* %1177, align 1, !tbaa !21
  %1179 = zext i8 %1178 to i64
  %1180 = shl nuw nsw i64 %1179, 24
  %1181 = or i64 %1176, %1180
  %1182 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 4
  %1183 = load i8, i8 addrspace(1)* %1182, align 1, !tbaa !21
  %1184 = zext i8 %1183 to i64
  %1185 = shl nuw nsw i64 %1184, 32
  %1186 = or i64 %1181, %1185
  %1187 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 5
  %1188 = load i8, i8 addrspace(1)* %1187, align 1, !tbaa !21
  %1189 = zext i8 %1188 to i64
  %1190 = shl nuw nsw i64 %1189, 40
  %1191 = or i64 %1186, %1190
  %1192 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 6
  %1193 = load i8, i8 addrspace(1)* %1192, align 1, !tbaa !21
  %1194 = zext i8 %1193 to i64
  %1195 = shl nuw nsw i64 %1194, 48
  %1196 = or i64 %1191, %1195
  %1197 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 7
  %1198 = load i8, i8 addrspace(1)* %1197, align 1, !tbaa !21
  %1199 = zext i8 %1198 to i64
  %1200 = shl nuw i64 %1199, 56
  %1201 = or i64 %1196, %1200
  %1202 = add nsw i32 %1159, -8
  %1203 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 8
  br label %1217

1204:                                             ; preds = %1162, %1204
  %1205 = phi i32 [ %1215, %1204 ], [ 0, %1162 ]
  %1206 = phi i64 [ %1214, %1204 ], [ 0, %1162 ]
  %1207 = zext i32 %1205 to i64
  %1208 = getelementptr inbounds i8, i8 addrspace(1)* %1158, i64 %1207
  %1209 = load i8, i8 addrspace(1)* %1208, align 1, !tbaa !21
  %1210 = zext i8 %1209 to i64
  %1211 = shl i32 %1205, 3
  %1212 = zext i32 %1211 to i64
  %1213 = shl nuw i64 %1210, %1212
  %1214 = or i64 %1213, %1206
  %1215 = add nuw nsw i32 %1205, 1
  %1216 = icmp eq i32 %1215, %1159
  br i1 %1216, label %1217, label %1204

1217:                                             ; preds = %1204, %1164, %1162
  %1218 = phi i8 addrspace(1)* [ %1203, %1164 ], [ %1158, %1162 ], [ %1158, %1204 ]
  %1219 = phi i32 [ %1202, %1164 ], [ 0, %1162 ], [ 0, %1204 ]
  %1220 = phi i64 [ %1201, %1164 ], [ 0, %1162 ], [ %1214, %1204 ]
  %1221 = icmp ugt i32 %1219, 7
  br i1 %1221, label %1224, label %1222

1222:                                             ; preds = %1217
  %1223 = icmp eq i32 %1219, 0
  br i1 %1223, label %1277, label %1264

1224:                                             ; preds = %1217
  %1225 = load i8, i8 addrspace(1)* %1218, align 1, !tbaa !21
  %1226 = zext i8 %1225 to i64
  %1227 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 1
  %1228 = load i8, i8 addrspace(1)* %1227, align 1, !tbaa !21
  %1229 = zext i8 %1228 to i64
  %1230 = shl nuw nsw i64 %1229, 8
  %1231 = or i64 %1230, %1226
  %1232 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 2
  %1233 = load i8, i8 addrspace(1)* %1232, align 1, !tbaa !21
  %1234 = zext i8 %1233 to i64
  %1235 = shl nuw nsw i64 %1234, 16
  %1236 = or i64 %1231, %1235
  %1237 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 3
  %1238 = load i8, i8 addrspace(1)* %1237, align 1, !tbaa !21
  %1239 = zext i8 %1238 to i64
  %1240 = shl nuw nsw i64 %1239, 24
  %1241 = or i64 %1236, %1240
  %1242 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 4
  %1243 = load i8, i8 addrspace(1)* %1242, align 1, !tbaa !21
  %1244 = zext i8 %1243 to i64
  %1245 = shl nuw nsw i64 %1244, 32
  %1246 = or i64 %1241, %1245
  %1247 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 5
  %1248 = load i8, i8 addrspace(1)* %1247, align 1, !tbaa !21
  %1249 = zext i8 %1248 to i64
  %1250 = shl nuw nsw i64 %1249, 40
  %1251 = or i64 %1246, %1250
  %1252 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 6
  %1253 = load i8, i8 addrspace(1)* %1252, align 1, !tbaa !21
  %1254 = zext i8 %1253 to i64
  %1255 = shl nuw nsw i64 %1254, 48
  %1256 = or i64 %1251, %1255
  %1257 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 7
  %1258 = load i8, i8 addrspace(1)* %1257, align 1, !tbaa !21
  %1259 = zext i8 %1258 to i64
  %1260 = shl nuw i64 %1259, 56
  %1261 = or i64 %1256, %1260
  %1262 = add nsw i32 %1219, -8
  %1263 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 8
  br label %1277

1264:                                             ; preds = %1222, %1264
  %1265 = phi i32 [ %1275, %1264 ], [ 0, %1222 ]
  %1266 = phi i64 [ %1274, %1264 ], [ 0, %1222 ]
  %1267 = zext i32 %1265 to i64
  %1268 = getelementptr inbounds i8, i8 addrspace(1)* %1218, i64 %1267
  %1269 = load i8, i8 addrspace(1)* %1268, align 1, !tbaa !21
  %1270 = zext i8 %1269 to i64
  %1271 = shl i32 %1265, 3
  %1272 = zext i32 %1271 to i64
  %1273 = shl nuw i64 %1270, %1272
  %1274 = or i64 %1273, %1266
  %1275 = add nuw nsw i32 %1265, 1
  %1276 = icmp eq i32 %1275, %1219
  br i1 %1276, label %1277, label %1264

1277:                                             ; preds = %1264, %1224, %1222
  %1278 = phi i8 addrspace(1)* [ %1263, %1224 ], [ %1218, %1222 ], [ %1218, %1264 ]
  %1279 = phi i32 [ %1262, %1224 ], [ 0, %1222 ], [ 0, %1264 ]
  %1280 = phi i64 [ %1261, %1224 ], [ 0, %1222 ], [ %1274, %1264 ]
  %1281 = icmp ugt i32 %1279, 7
  br i1 %1281, label %1284, label %1282

1282:                                             ; preds = %1277
  %1283 = icmp eq i32 %1279, 0
  br i1 %1283, label %1337, label %1324

1284:                                             ; preds = %1277
  %1285 = load i8, i8 addrspace(1)* %1278, align 1, !tbaa !21
  %1286 = zext i8 %1285 to i64
  %1287 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 1
  %1288 = load i8, i8 addrspace(1)* %1287, align 1, !tbaa !21
  %1289 = zext i8 %1288 to i64
  %1290 = shl nuw nsw i64 %1289, 8
  %1291 = or i64 %1290, %1286
  %1292 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 2
  %1293 = load i8, i8 addrspace(1)* %1292, align 1, !tbaa !21
  %1294 = zext i8 %1293 to i64
  %1295 = shl nuw nsw i64 %1294, 16
  %1296 = or i64 %1291, %1295
  %1297 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 3
  %1298 = load i8, i8 addrspace(1)* %1297, align 1, !tbaa !21
  %1299 = zext i8 %1298 to i64
  %1300 = shl nuw nsw i64 %1299, 24
  %1301 = or i64 %1296, %1300
  %1302 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 4
  %1303 = load i8, i8 addrspace(1)* %1302, align 1, !tbaa !21
  %1304 = zext i8 %1303 to i64
  %1305 = shl nuw nsw i64 %1304, 32
  %1306 = or i64 %1301, %1305
  %1307 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 5
  %1308 = load i8, i8 addrspace(1)* %1307, align 1, !tbaa !21
  %1309 = zext i8 %1308 to i64
  %1310 = shl nuw nsw i64 %1309, 40
  %1311 = or i64 %1306, %1310
  %1312 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 6
  %1313 = load i8, i8 addrspace(1)* %1312, align 1, !tbaa !21
  %1314 = zext i8 %1313 to i64
  %1315 = shl nuw nsw i64 %1314, 48
  %1316 = or i64 %1311, %1315
  %1317 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 7
  %1318 = load i8, i8 addrspace(1)* %1317, align 1, !tbaa !21
  %1319 = zext i8 %1318 to i64
  %1320 = shl nuw i64 %1319, 56
  %1321 = or i64 %1316, %1320
  %1322 = add nsw i32 %1279, -8
  %1323 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 8
  br label %1337

1324:                                             ; preds = %1282, %1324
  %1325 = phi i32 [ %1335, %1324 ], [ 0, %1282 ]
  %1326 = phi i64 [ %1334, %1324 ], [ 0, %1282 ]
  %1327 = zext i32 %1325 to i64
  %1328 = getelementptr inbounds i8, i8 addrspace(1)* %1278, i64 %1327
  %1329 = load i8, i8 addrspace(1)* %1328, align 1, !tbaa !21
  %1330 = zext i8 %1329 to i64
  %1331 = shl i32 %1325, 3
  %1332 = zext i32 %1331 to i64
  %1333 = shl nuw i64 %1330, %1332
  %1334 = or i64 %1333, %1326
  %1335 = add nuw nsw i32 %1325, 1
  %1336 = icmp eq i32 %1335, %1279
  br i1 %1336, label %1337, label %1324

1337:                                             ; preds = %1324, %1284, %1282
  %1338 = phi i8 addrspace(1)* [ %1323, %1284 ], [ %1278, %1282 ], [ %1278, %1324 ]
  %1339 = phi i32 [ %1322, %1284 ], [ 0, %1282 ], [ 0, %1324 ]
  %1340 = phi i64 [ %1321, %1284 ], [ 0, %1282 ], [ %1334, %1324 ]
  %1341 = icmp ugt i32 %1339, 7
  br i1 %1341, label %1344, label %1342

1342:                                             ; preds = %1337
  %1343 = icmp eq i32 %1339, 0
  br i1 %1343, label %1397, label %1384

1344:                                             ; preds = %1337
  %1345 = load i8, i8 addrspace(1)* %1338, align 1, !tbaa !21
  %1346 = zext i8 %1345 to i64
  %1347 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 1
  %1348 = load i8, i8 addrspace(1)* %1347, align 1, !tbaa !21
  %1349 = zext i8 %1348 to i64
  %1350 = shl nuw nsw i64 %1349, 8
  %1351 = or i64 %1350, %1346
  %1352 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 2
  %1353 = load i8, i8 addrspace(1)* %1352, align 1, !tbaa !21
  %1354 = zext i8 %1353 to i64
  %1355 = shl nuw nsw i64 %1354, 16
  %1356 = or i64 %1351, %1355
  %1357 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 3
  %1358 = load i8, i8 addrspace(1)* %1357, align 1, !tbaa !21
  %1359 = zext i8 %1358 to i64
  %1360 = shl nuw nsw i64 %1359, 24
  %1361 = or i64 %1356, %1360
  %1362 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 4
  %1363 = load i8, i8 addrspace(1)* %1362, align 1, !tbaa !21
  %1364 = zext i8 %1363 to i64
  %1365 = shl nuw nsw i64 %1364, 32
  %1366 = or i64 %1361, %1365
  %1367 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 5
  %1368 = load i8, i8 addrspace(1)* %1367, align 1, !tbaa !21
  %1369 = zext i8 %1368 to i64
  %1370 = shl nuw nsw i64 %1369, 40
  %1371 = or i64 %1366, %1370
  %1372 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 6
  %1373 = load i8, i8 addrspace(1)* %1372, align 1, !tbaa !21
  %1374 = zext i8 %1373 to i64
  %1375 = shl nuw nsw i64 %1374, 48
  %1376 = or i64 %1371, %1375
  %1377 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 7
  %1378 = load i8, i8 addrspace(1)* %1377, align 1, !tbaa !21
  %1379 = zext i8 %1378 to i64
  %1380 = shl nuw i64 %1379, 56
  %1381 = or i64 %1376, %1380
  %1382 = add nsw i32 %1339, -8
  %1383 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 8
  br label %1397

1384:                                             ; preds = %1342, %1384
  %1385 = phi i32 [ %1395, %1384 ], [ 0, %1342 ]
  %1386 = phi i64 [ %1394, %1384 ], [ 0, %1342 ]
  %1387 = zext i32 %1385 to i64
  %1388 = getelementptr inbounds i8, i8 addrspace(1)* %1338, i64 %1387
  %1389 = load i8, i8 addrspace(1)* %1388, align 1, !tbaa !21
  %1390 = zext i8 %1389 to i64
  %1391 = shl i32 %1385, 3
  %1392 = zext i32 %1391 to i64
  %1393 = shl nuw i64 %1390, %1392
  %1394 = or i64 %1393, %1386
  %1395 = add nuw nsw i32 %1385, 1
  %1396 = icmp eq i32 %1395, %1339
  br i1 %1396, label %1397, label %1384

1397:                                             ; preds = %1384, %1344, %1342
  %1398 = phi i8 addrspace(1)* [ %1383, %1344 ], [ %1338, %1342 ], [ %1338, %1384 ]
  %1399 = phi i32 [ %1382, %1344 ], [ 0, %1342 ], [ 0, %1384 ]
  %1400 = phi i64 [ %1381, %1344 ], [ 0, %1342 ], [ %1394, %1384 ]
  %1401 = icmp ugt i32 %1399, 7
  br i1 %1401, label %1404, label %1402

1402:                                             ; preds = %1397
  %1403 = icmp eq i32 %1399, 0
  br i1 %1403, label %1457, label %1444

1404:                                             ; preds = %1397
  %1405 = load i8, i8 addrspace(1)* %1398, align 1, !tbaa !21
  %1406 = zext i8 %1405 to i64
  %1407 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 1
  %1408 = load i8, i8 addrspace(1)* %1407, align 1, !tbaa !21
  %1409 = zext i8 %1408 to i64
  %1410 = shl nuw nsw i64 %1409, 8
  %1411 = or i64 %1410, %1406
  %1412 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 2
  %1413 = load i8, i8 addrspace(1)* %1412, align 1, !tbaa !21
  %1414 = zext i8 %1413 to i64
  %1415 = shl nuw nsw i64 %1414, 16
  %1416 = or i64 %1411, %1415
  %1417 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 3
  %1418 = load i8, i8 addrspace(1)* %1417, align 1, !tbaa !21
  %1419 = zext i8 %1418 to i64
  %1420 = shl nuw nsw i64 %1419, 24
  %1421 = or i64 %1416, %1420
  %1422 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 4
  %1423 = load i8, i8 addrspace(1)* %1422, align 1, !tbaa !21
  %1424 = zext i8 %1423 to i64
  %1425 = shl nuw nsw i64 %1424, 32
  %1426 = or i64 %1421, %1425
  %1427 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 5
  %1428 = load i8, i8 addrspace(1)* %1427, align 1, !tbaa !21
  %1429 = zext i8 %1428 to i64
  %1430 = shl nuw nsw i64 %1429, 40
  %1431 = or i64 %1426, %1430
  %1432 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 6
  %1433 = load i8, i8 addrspace(1)* %1432, align 1, !tbaa !21
  %1434 = zext i8 %1433 to i64
  %1435 = shl nuw nsw i64 %1434, 48
  %1436 = or i64 %1431, %1435
  %1437 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 7
  %1438 = load i8, i8 addrspace(1)* %1437, align 1, !tbaa !21
  %1439 = zext i8 %1438 to i64
  %1440 = shl nuw i64 %1439, 56
  %1441 = or i64 %1436, %1440
  %1442 = add nsw i32 %1399, -8
  %1443 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 8
  br label %1457

1444:                                             ; preds = %1402, %1444
  %1445 = phi i32 [ %1455, %1444 ], [ 0, %1402 ]
  %1446 = phi i64 [ %1454, %1444 ], [ 0, %1402 ]
  %1447 = zext i32 %1445 to i64
  %1448 = getelementptr inbounds i8, i8 addrspace(1)* %1398, i64 %1447
  %1449 = load i8, i8 addrspace(1)* %1448, align 1, !tbaa !21
  %1450 = zext i8 %1449 to i64
  %1451 = shl i32 %1445, 3
  %1452 = zext i32 %1451 to i64
  %1453 = shl nuw i64 %1450, %1452
  %1454 = or i64 %1453, %1446
  %1455 = add nuw nsw i32 %1445, 1
  %1456 = icmp eq i32 %1455, %1399
  br i1 %1456, label %1457, label %1444

1457:                                             ; preds = %1444, %1404, %1402
  %1458 = phi i8 addrspace(1)* [ %1443, %1404 ], [ %1398, %1402 ], [ %1398, %1444 ]
  %1459 = phi i32 [ %1442, %1404 ], [ 0, %1402 ], [ 0, %1444 ]
  %1460 = phi i64 [ %1441, %1404 ], [ 0, %1402 ], [ %1454, %1444 ]
  %1461 = icmp ugt i32 %1459, 7
  br i1 %1461, label %1464, label %1462

1462:                                             ; preds = %1457
  %1463 = icmp eq i32 %1459, 0
  br i1 %1463, label %1515, label %1502

1464:                                             ; preds = %1457
  %1465 = load i8, i8 addrspace(1)* %1458, align 1, !tbaa !21
  %1466 = zext i8 %1465 to i64
  %1467 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 1
  %1468 = load i8, i8 addrspace(1)* %1467, align 1, !tbaa !21
  %1469 = zext i8 %1468 to i64
  %1470 = shl nuw nsw i64 %1469, 8
  %1471 = or i64 %1470, %1466
  %1472 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 2
  %1473 = load i8, i8 addrspace(1)* %1472, align 1, !tbaa !21
  %1474 = zext i8 %1473 to i64
  %1475 = shl nuw nsw i64 %1474, 16
  %1476 = or i64 %1471, %1475
  %1477 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 3
  %1478 = load i8, i8 addrspace(1)* %1477, align 1, !tbaa !21
  %1479 = zext i8 %1478 to i64
  %1480 = shl nuw nsw i64 %1479, 24
  %1481 = or i64 %1476, %1480
  %1482 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 4
  %1483 = load i8, i8 addrspace(1)* %1482, align 1, !tbaa !21
  %1484 = zext i8 %1483 to i64
  %1485 = shl nuw nsw i64 %1484, 32
  %1486 = or i64 %1481, %1485
  %1487 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 5
  %1488 = load i8, i8 addrspace(1)* %1487, align 1, !tbaa !21
  %1489 = zext i8 %1488 to i64
  %1490 = shl nuw nsw i64 %1489, 40
  %1491 = or i64 %1486, %1490
  %1492 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 6
  %1493 = load i8, i8 addrspace(1)* %1492, align 1, !tbaa !21
  %1494 = zext i8 %1493 to i64
  %1495 = shl nuw nsw i64 %1494, 48
  %1496 = or i64 %1491, %1495
  %1497 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 7
  %1498 = load i8, i8 addrspace(1)* %1497, align 1, !tbaa !21
  %1499 = zext i8 %1498 to i64
  %1500 = shl nuw i64 %1499, 56
  %1501 = or i64 %1496, %1500
  br label %1515

1502:                                             ; preds = %1462, %1502
  %1503 = phi i32 [ %1513, %1502 ], [ 0, %1462 ]
  %1504 = phi i64 [ %1512, %1502 ], [ 0, %1462 ]
  %1505 = zext i32 %1503 to i64
  %1506 = getelementptr inbounds i8, i8 addrspace(1)* %1458, i64 %1505
  %1507 = load i8, i8 addrspace(1)* %1506, align 1, !tbaa !21
  %1508 = zext i8 %1507 to i64
  %1509 = shl i32 %1503, 3
  %1510 = zext i32 %1509 to i64
  %1511 = shl nuw i64 %1508, %1510
  %1512 = or i64 %1511, %1504
  %1513 = add nuw nsw i32 %1503, 1
  %1514 = icmp eq i32 %1513, %1459
  br i1 %1514, label %1515, label %1502

1515:                                             ; preds = %1502, %1464, %1462
  %1516 = phi i64 [ %1501, %1464 ], [ 0, %1462 ], [ %1512, %1502 ]
  %1517 = shl nuw nsw i64 %1098, 2
  %1518 = add nuw nsw i64 %1517, 28
  %1519 = and i64 %1518, 480
  %1520 = and i64 %1100, -225
  %1521 = or i64 %1520, %1519
  %1522 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %609, i32 noundef 2, i64 noundef %1521, i64 noundef %1160, i64 noundef %1220, i64 noundef %1280, i64 noundef %1340, i64 noundef %1400, i64 noundef %1460, i64 noundef %1516) #12
  %1523 = sub i64 %1090, %1098
  %1524 = getelementptr inbounds i8, i8 addrspace(1)* %1091, i64 %1098
  %1525 = icmp eq i64 %1523, 0
  br i1 %1525, label %1526, label %1089

1526:                                             ; preds = %1515, %602, %1082
  br i1 %123, label %1612, label %1527

1527:                                             ; preds = %1526
  %1528 = and i32 %114, 7
  %1529 = icmp ult i32 %114, 8
  br i1 %1529, label %1594, label %1530

1530:                                             ; preds = %1527
  %1531 = and i32 %114, 2147483640
  br label %1532

1532:                                             ; preds = %1532, %1530
  %1533 = phi i32 [ 0, %1530 ], [ %1591, %1532 ]
  %1534 = phi i32 [ 0, %1530 ], [ %1590, %1532 ]
  %1535 = phi i32 [ 0, %1530 ], [ %1592, %1532 ]
  %1536 = mul nsw i32 %1534, 31
  %1537 = zext i32 %1533 to i64
  %1538 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1537
  %1539 = load i8, i8 addrspace(1)* %1538, align 1, !tbaa !7
  %1540 = sext i8 %1539 to i32
  %1541 = add nsw i32 %1536, %1540
  %1542 = or i32 %1533, 1
  %1543 = mul nsw i32 %1541, 31
  %1544 = zext i32 %1542 to i64
  %1545 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1544
  %1546 = load i8, i8 addrspace(1)* %1545, align 1, !tbaa !7
  %1547 = sext i8 %1546 to i32
  %1548 = add nsw i32 %1543, %1547
  %1549 = or i32 %1533, 2
  %1550 = mul nsw i32 %1548, 31
  %1551 = zext i32 %1549 to i64
  %1552 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1551
  %1553 = load i8, i8 addrspace(1)* %1552, align 1, !tbaa !7
  %1554 = sext i8 %1553 to i32
  %1555 = add nsw i32 %1550, %1554
  %1556 = or i32 %1533, 3
  %1557 = mul nsw i32 %1555, 31
  %1558 = zext i32 %1556 to i64
  %1559 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1558
  %1560 = load i8, i8 addrspace(1)* %1559, align 1, !tbaa !7
  %1561 = sext i8 %1560 to i32
  %1562 = add nsw i32 %1557, %1561
  %1563 = or i32 %1533, 4
  %1564 = mul nsw i32 %1562, 31
  %1565 = zext i32 %1563 to i64
  %1566 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1565
  %1567 = load i8, i8 addrspace(1)* %1566, align 1, !tbaa !7
  %1568 = sext i8 %1567 to i32
  %1569 = add nsw i32 %1564, %1568
  %1570 = or i32 %1533, 5
  %1571 = mul nsw i32 %1569, 31
  %1572 = zext i32 %1570 to i64
  %1573 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1572
  %1574 = load i8, i8 addrspace(1)* %1573, align 1, !tbaa !7
  %1575 = sext i8 %1574 to i32
  %1576 = add nsw i32 %1571, %1575
  %1577 = or i32 %1533, 6
  %1578 = mul nsw i32 %1576, 31
  %1579 = zext i32 %1577 to i64
  %1580 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1579
  %1581 = load i8, i8 addrspace(1)* %1580, align 1, !tbaa !7
  %1582 = sext i8 %1581 to i32
  %1583 = add nsw i32 %1578, %1582
  %1584 = or i32 %1533, 7
  %1585 = mul nsw i32 %1583, 31
  %1586 = zext i32 %1584 to i64
  %1587 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1586
  %1588 = load i8, i8 addrspace(1)* %1587, align 1, !tbaa !7
  %1589 = sext i8 %1588 to i32
  %1590 = add nsw i32 %1585, %1589
  %1591 = add nuw nsw i32 %1533, 8
  %1592 = add i32 %1535, 8
  %1593 = icmp eq i32 %1592, %1531
  br i1 %1593, label %1594, label %1532, !llvm.loop !23

1594:                                             ; preds = %1532, %1527
  %1595 = phi i32 [ undef, %1527 ], [ %1590, %1532 ]
  %1596 = phi i32 [ 0, %1527 ], [ %1591, %1532 ]
  %1597 = phi i32 [ 0, %1527 ], [ %1590, %1532 ]
  %1598 = icmp eq i32 %1528, 0
  br i1 %1598, label %1612, label %1599

1599:                                             ; preds = %1594, %1599
  %1600 = phi i32 [ %1609, %1599 ], [ %1596, %1594 ]
  %1601 = phi i32 [ %1608, %1599 ], [ %1597, %1594 ]
  %1602 = phi i32 [ %1610, %1599 ], [ 0, %1594 ]
  %1603 = mul nsw i32 %1601, 31
  %1604 = zext i32 %1600 to i64
  %1605 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %1604
  %1606 = load i8, i8 addrspace(1)* %1605, align 1, !tbaa !7
  %1607 = sext i8 %1606 to i32
  %1608 = add nsw i32 %1603, %1607
  %1609 = add nuw nsw i32 %1600, 1
  %1610 = add i32 %1602, 1
  %1611 = icmp eq i32 %1610, %1528
  br i1 %1611, label %1612, label %1599, !llvm.loop !24

1612:                                             ; preds = %1594, %1599, %1526
  %1613 = phi i32 [ 0, %1526 ], [ %1595, %1594 ], [ %1608, %1599 ]
  %1614 = icmp eq i32 %1613, %0
  br i1 %1614, label %1615, label %2538

1615:                                             ; preds = %1612
  %1616 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %1617 = getelementptr inbounds i8, i8 addrspace(4)* %1616, i64 24
  %1618 = bitcast i8 addrspace(4)* %1617 to i64 addrspace(4)*
  %1619 = load i64, i64 addrspace(4)* %1618, align 8, !tbaa !17
  %1620 = inttoptr i64 %1619 to i8 addrspace(1)*
  %1621 = addrspacecast i8 addrspace(1)* %1620 to i8*
  %1622 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1621, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1623 = extractelement <2 x i64> %1622, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1624, label %1628

1624:                                             ; preds = %1615
  %1625 = and i64 %1623, -225
  %1626 = or i64 %1625, 32
  %1627 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1621, i32 noundef 2, i64 noundef %1626, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2069

1628:                                             ; preds = %1615
  %1629 = and i64 %1623, 2
  %1630 = and i64 %1623, -3
  %1631 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1630, i64 0
  br label %1632

1632:                                             ; preds = %2058, %1628
  %1633 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 49) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([50 x i8]* addrspacecast ([50 x i8] addrspace(4)* @.str.2 to [50 x i8]*) to i64)), i64 1))), %1628 ], [ %2066, %2058 ]
  %1634 = phi i8 addrspace(4)* [ getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1628 ], [ %2067, %2058 ]
  %1635 = phi <2 x i64> [ %1631, %1628 ], [ %2065, %2058 ]
  %1636 = icmp ugt i64 %1633, 56
  %1637 = extractelement <2 x i64> %1635, i64 0
  %1638 = or i64 %1637, %1629
  %1639 = insertelement <2 x i64> poison, i64 %1638, i64 0
  %1640 = select i1 %1636, <2 x i64> %1635, <2 x i64> %1639
  %1641 = tail call i64 @llvm.umin.i64(i64 %1633, i64 56)
  %1642 = trunc i64 %1641 to i32
  %1643 = extractelement <2 x i64> %1640, i64 0
  %1644 = icmp ugt i32 %1642, 7
  br i1 %1644, label %1647, label %1645

1645:                                             ; preds = %1632
  %1646 = icmp eq i32 %1642, 0
  br i1 %1646, label %1700, label %1687

1647:                                             ; preds = %1632
  %1648 = load i8, i8 addrspace(4)* %1634, align 1, !tbaa !21
  %1649 = zext i8 %1648 to i64
  %1650 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 1
  %1651 = load i8, i8 addrspace(4)* %1650, align 1, !tbaa !21
  %1652 = zext i8 %1651 to i64
  %1653 = shl nuw nsw i64 %1652, 8
  %1654 = or i64 %1653, %1649
  %1655 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 2
  %1656 = load i8, i8 addrspace(4)* %1655, align 1, !tbaa !21
  %1657 = zext i8 %1656 to i64
  %1658 = shl nuw nsw i64 %1657, 16
  %1659 = or i64 %1654, %1658
  %1660 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 3
  %1661 = load i8, i8 addrspace(4)* %1660, align 1, !tbaa !21
  %1662 = zext i8 %1661 to i64
  %1663 = shl nuw nsw i64 %1662, 24
  %1664 = or i64 %1659, %1663
  %1665 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 4
  %1666 = load i8, i8 addrspace(4)* %1665, align 1, !tbaa !21
  %1667 = zext i8 %1666 to i64
  %1668 = shl nuw nsw i64 %1667, 32
  %1669 = or i64 %1664, %1668
  %1670 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 5
  %1671 = load i8, i8 addrspace(4)* %1670, align 1, !tbaa !21
  %1672 = zext i8 %1671 to i64
  %1673 = shl nuw nsw i64 %1672, 40
  %1674 = or i64 %1669, %1673
  %1675 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 6
  %1676 = load i8, i8 addrspace(4)* %1675, align 1, !tbaa !21
  %1677 = zext i8 %1676 to i64
  %1678 = shl nuw nsw i64 %1677, 48
  %1679 = or i64 %1674, %1678
  %1680 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 7
  %1681 = load i8, i8 addrspace(4)* %1680, align 1, !tbaa !21
  %1682 = zext i8 %1681 to i64
  %1683 = shl nuw i64 %1682, 56
  %1684 = or i64 %1679, %1683
  %1685 = add nsw i32 %1642, -8
  %1686 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 8
  br label %1700

1687:                                             ; preds = %1645, %1687
  %1688 = phi i32 [ %1698, %1687 ], [ 0, %1645 ]
  %1689 = phi i64 [ %1697, %1687 ], [ 0, %1645 ]
  %1690 = zext i32 %1688 to i64
  %1691 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 %1690
  %1692 = load i8, i8 addrspace(4)* %1691, align 1, !tbaa !21
  %1693 = zext i8 %1692 to i64
  %1694 = shl i32 %1688, 3
  %1695 = zext i32 %1694 to i64
  %1696 = shl nuw i64 %1693, %1695
  %1697 = or i64 %1696, %1689
  %1698 = add nuw nsw i32 %1688, 1
  %1699 = icmp eq i32 %1698, %1642
  br i1 %1699, label %1700, label %1687, !llvm.loop !22

1700:                                             ; preds = %1687, %1647, %1645
  %1701 = phi i8 addrspace(4)* [ %1686, %1647 ], [ %1634, %1645 ], [ %1634, %1687 ]
  %1702 = phi i32 [ %1685, %1647 ], [ 0, %1645 ], [ 0, %1687 ]
  %1703 = phi i64 [ %1684, %1647 ], [ 0, %1645 ], [ %1697, %1687 ]
  %1704 = icmp ugt i32 %1702, 7
  br i1 %1704, label %1707, label %1705

1705:                                             ; preds = %1700
  %1706 = icmp eq i32 %1702, 0
  br i1 %1706, label %1760, label %1747

1707:                                             ; preds = %1700
  %1708 = load i8, i8 addrspace(4)* %1701, align 1, !tbaa !21
  %1709 = zext i8 %1708 to i64
  %1710 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 1
  %1711 = load i8, i8 addrspace(4)* %1710, align 1, !tbaa !21
  %1712 = zext i8 %1711 to i64
  %1713 = shl nuw nsw i64 %1712, 8
  %1714 = or i64 %1713, %1709
  %1715 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 2
  %1716 = load i8, i8 addrspace(4)* %1715, align 1, !tbaa !21
  %1717 = zext i8 %1716 to i64
  %1718 = shl nuw nsw i64 %1717, 16
  %1719 = or i64 %1714, %1718
  %1720 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 3
  %1721 = load i8, i8 addrspace(4)* %1720, align 1, !tbaa !21
  %1722 = zext i8 %1721 to i64
  %1723 = shl nuw nsw i64 %1722, 24
  %1724 = or i64 %1719, %1723
  %1725 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 4
  %1726 = load i8, i8 addrspace(4)* %1725, align 1, !tbaa !21
  %1727 = zext i8 %1726 to i64
  %1728 = shl nuw nsw i64 %1727, 32
  %1729 = or i64 %1724, %1728
  %1730 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 5
  %1731 = load i8, i8 addrspace(4)* %1730, align 1, !tbaa !21
  %1732 = zext i8 %1731 to i64
  %1733 = shl nuw nsw i64 %1732, 40
  %1734 = or i64 %1729, %1733
  %1735 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 6
  %1736 = load i8, i8 addrspace(4)* %1735, align 1, !tbaa !21
  %1737 = zext i8 %1736 to i64
  %1738 = shl nuw nsw i64 %1737, 48
  %1739 = or i64 %1734, %1738
  %1740 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 7
  %1741 = load i8, i8 addrspace(4)* %1740, align 1, !tbaa !21
  %1742 = zext i8 %1741 to i64
  %1743 = shl nuw i64 %1742, 56
  %1744 = or i64 %1739, %1743
  %1745 = add nsw i32 %1702, -8
  %1746 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 8
  br label %1760

1747:                                             ; preds = %1705, %1747
  %1748 = phi i32 [ %1758, %1747 ], [ 0, %1705 ]
  %1749 = phi i64 [ %1757, %1747 ], [ 0, %1705 ]
  %1750 = zext i32 %1748 to i64
  %1751 = getelementptr inbounds i8, i8 addrspace(4)* %1701, i64 %1750
  %1752 = load i8, i8 addrspace(4)* %1751, align 1, !tbaa !21
  %1753 = zext i8 %1752 to i64
  %1754 = shl i32 %1748, 3
  %1755 = zext i32 %1754 to i64
  %1756 = shl nuw i64 %1753, %1755
  %1757 = or i64 %1756, %1749
  %1758 = add nuw nsw i32 %1748, 1
  %1759 = icmp eq i32 %1758, %1702
  br i1 %1759, label %1760, label %1747

1760:                                             ; preds = %1747, %1707, %1705
  %1761 = phi i8 addrspace(4)* [ %1746, %1707 ], [ %1701, %1705 ], [ %1701, %1747 ]
  %1762 = phi i32 [ %1745, %1707 ], [ 0, %1705 ], [ 0, %1747 ]
  %1763 = phi i64 [ %1744, %1707 ], [ 0, %1705 ], [ %1757, %1747 ]
  %1764 = icmp ugt i32 %1762, 7
  br i1 %1764, label %1767, label %1765

1765:                                             ; preds = %1760
  %1766 = icmp eq i32 %1762, 0
  br i1 %1766, label %1820, label %1807

1767:                                             ; preds = %1760
  %1768 = load i8, i8 addrspace(4)* %1761, align 1, !tbaa !21
  %1769 = zext i8 %1768 to i64
  %1770 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 1
  %1771 = load i8, i8 addrspace(4)* %1770, align 1, !tbaa !21
  %1772 = zext i8 %1771 to i64
  %1773 = shl nuw nsw i64 %1772, 8
  %1774 = or i64 %1773, %1769
  %1775 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 2
  %1776 = load i8, i8 addrspace(4)* %1775, align 1, !tbaa !21
  %1777 = zext i8 %1776 to i64
  %1778 = shl nuw nsw i64 %1777, 16
  %1779 = or i64 %1774, %1778
  %1780 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 3
  %1781 = load i8, i8 addrspace(4)* %1780, align 1, !tbaa !21
  %1782 = zext i8 %1781 to i64
  %1783 = shl nuw nsw i64 %1782, 24
  %1784 = or i64 %1779, %1783
  %1785 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 4
  %1786 = load i8, i8 addrspace(4)* %1785, align 1, !tbaa !21
  %1787 = zext i8 %1786 to i64
  %1788 = shl nuw nsw i64 %1787, 32
  %1789 = or i64 %1784, %1788
  %1790 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 5
  %1791 = load i8, i8 addrspace(4)* %1790, align 1, !tbaa !21
  %1792 = zext i8 %1791 to i64
  %1793 = shl nuw nsw i64 %1792, 40
  %1794 = or i64 %1789, %1793
  %1795 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 6
  %1796 = load i8, i8 addrspace(4)* %1795, align 1, !tbaa !21
  %1797 = zext i8 %1796 to i64
  %1798 = shl nuw nsw i64 %1797, 48
  %1799 = or i64 %1794, %1798
  %1800 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 7
  %1801 = load i8, i8 addrspace(4)* %1800, align 1, !tbaa !21
  %1802 = zext i8 %1801 to i64
  %1803 = shl nuw i64 %1802, 56
  %1804 = or i64 %1799, %1803
  %1805 = add nsw i32 %1762, -8
  %1806 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 8
  br label %1820

1807:                                             ; preds = %1765, %1807
  %1808 = phi i32 [ %1818, %1807 ], [ 0, %1765 ]
  %1809 = phi i64 [ %1817, %1807 ], [ 0, %1765 ]
  %1810 = zext i32 %1808 to i64
  %1811 = getelementptr inbounds i8, i8 addrspace(4)* %1761, i64 %1810
  %1812 = load i8, i8 addrspace(4)* %1811, align 1, !tbaa !21
  %1813 = zext i8 %1812 to i64
  %1814 = shl i32 %1808, 3
  %1815 = zext i32 %1814 to i64
  %1816 = shl nuw i64 %1813, %1815
  %1817 = or i64 %1816, %1809
  %1818 = add nuw nsw i32 %1808, 1
  %1819 = icmp eq i32 %1818, %1762
  br i1 %1819, label %1820, label %1807

1820:                                             ; preds = %1807, %1767, %1765
  %1821 = phi i8 addrspace(4)* [ %1806, %1767 ], [ %1761, %1765 ], [ %1761, %1807 ]
  %1822 = phi i32 [ %1805, %1767 ], [ 0, %1765 ], [ 0, %1807 ]
  %1823 = phi i64 [ %1804, %1767 ], [ 0, %1765 ], [ %1817, %1807 ]
  %1824 = icmp ugt i32 %1822, 7
  br i1 %1824, label %1827, label %1825

1825:                                             ; preds = %1820
  %1826 = icmp eq i32 %1822, 0
  br i1 %1826, label %1880, label %1867

1827:                                             ; preds = %1820
  %1828 = load i8, i8 addrspace(4)* %1821, align 1, !tbaa !21
  %1829 = zext i8 %1828 to i64
  %1830 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 1
  %1831 = load i8, i8 addrspace(4)* %1830, align 1, !tbaa !21
  %1832 = zext i8 %1831 to i64
  %1833 = shl nuw nsw i64 %1832, 8
  %1834 = or i64 %1833, %1829
  %1835 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 2
  %1836 = load i8, i8 addrspace(4)* %1835, align 1, !tbaa !21
  %1837 = zext i8 %1836 to i64
  %1838 = shl nuw nsw i64 %1837, 16
  %1839 = or i64 %1834, %1838
  %1840 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 3
  %1841 = load i8, i8 addrspace(4)* %1840, align 1, !tbaa !21
  %1842 = zext i8 %1841 to i64
  %1843 = shl nuw nsw i64 %1842, 24
  %1844 = or i64 %1839, %1843
  %1845 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 4
  %1846 = load i8, i8 addrspace(4)* %1845, align 1, !tbaa !21
  %1847 = zext i8 %1846 to i64
  %1848 = shl nuw nsw i64 %1847, 32
  %1849 = or i64 %1844, %1848
  %1850 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 5
  %1851 = load i8, i8 addrspace(4)* %1850, align 1, !tbaa !21
  %1852 = zext i8 %1851 to i64
  %1853 = shl nuw nsw i64 %1852, 40
  %1854 = or i64 %1849, %1853
  %1855 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 6
  %1856 = load i8, i8 addrspace(4)* %1855, align 1, !tbaa !21
  %1857 = zext i8 %1856 to i64
  %1858 = shl nuw nsw i64 %1857, 48
  %1859 = or i64 %1854, %1858
  %1860 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 7
  %1861 = load i8, i8 addrspace(4)* %1860, align 1, !tbaa !21
  %1862 = zext i8 %1861 to i64
  %1863 = shl nuw i64 %1862, 56
  %1864 = or i64 %1859, %1863
  %1865 = add nsw i32 %1822, -8
  %1866 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 8
  br label %1880

1867:                                             ; preds = %1825, %1867
  %1868 = phi i32 [ %1878, %1867 ], [ 0, %1825 ]
  %1869 = phi i64 [ %1877, %1867 ], [ 0, %1825 ]
  %1870 = zext i32 %1868 to i64
  %1871 = getelementptr inbounds i8, i8 addrspace(4)* %1821, i64 %1870
  %1872 = load i8, i8 addrspace(4)* %1871, align 1, !tbaa !21
  %1873 = zext i8 %1872 to i64
  %1874 = shl i32 %1868, 3
  %1875 = zext i32 %1874 to i64
  %1876 = shl nuw i64 %1873, %1875
  %1877 = or i64 %1876, %1869
  %1878 = add nuw nsw i32 %1868, 1
  %1879 = icmp eq i32 %1878, %1822
  br i1 %1879, label %1880, label %1867

1880:                                             ; preds = %1867, %1827, %1825
  %1881 = phi i8 addrspace(4)* [ %1866, %1827 ], [ %1821, %1825 ], [ %1821, %1867 ]
  %1882 = phi i32 [ %1865, %1827 ], [ 0, %1825 ], [ 0, %1867 ]
  %1883 = phi i64 [ %1864, %1827 ], [ 0, %1825 ], [ %1877, %1867 ]
  %1884 = icmp ugt i32 %1882, 7
  br i1 %1884, label %1887, label %1885

1885:                                             ; preds = %1880
  %1886 = icmp eq i32 %1882, 0
  br i1 %1886, label %1940, label %1927

1887:                                             ; preds = %1880
  %1888 = load i8, i8 addrspace(4)* %1881, align 1, !tbaa !21
  %1889 = zext i8 %1888 to i64
  %1890 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 1
  %1891 = load i8, i8 addrspace(4)* %1890, align 1, !tbaa !21
  %1892 = zext i8 %1891 to i64
  %1893 = shl nuw nsw i64 %1892, 8
  %1894 = or i64 %1893, %1889
  %1895 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 2
  %1896 = load i8, i8 addrspace(4)* %1895, align 1, !tbaa !21
  %1897 = zext i8 %1896 to i64
  %1898 = shl nuw nsw i64 %1897, 16
  %1899 = or i64 %1894, %1898
  %1900 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 3
  %1901 = load i8, i8 addrspace(4)* %1900, align 1, !tbaa !21
  %1902 = zext i8 %1901 to i64
  %1903 = shl nuw nsw i64 %1902, 24
  %1904 = or i64 %1899, %1903
  %1905 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 4
  %1906 = load i8, i8 addrspace(4)* %1905, align 1, !tbaa !21
  %1907 = zext i8 %1906 to i64
  %1908 = shl nuw nsw i64 %1907, 32
  %1909 = or i64 %1904, %1908
  %1910 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 5
  %1911 = load i8, i8 addrspace(4)* %1910, align 1, !tbaa !21
  %1912 = zext i8 %1911 to i64
  %1913 = shl nuw nsw i64 %1912, 40
  %1914 = or i64 %1909, %1913
  %1915 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 6
  %1916 = load i8, i8 addrspace(4)* %1915, align 1, !tbaa !21
  %1917 = zext i8 %1916 to i64
  %1918 = shl nuw nsw i64 %1917, 48
  %1919 = or i64 %1914, %1918
  %1920 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 7
  %1921 = load i8, i8 addrspace(4)* %1920, align 1, !tbaa !21
  %1922 = zext i8 %1921 to i64
  %1923 = shl nuw i64 %1922, 56
  %1924 = or i64 %1919, %1923
  %1925 = add nsw i32 %1882, -8
  %1926 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 8
  br label %1940

1927:                                             ; preds = %1885, %1927
  %1928 = phi i32 [ %1938, %1927 ], [ 0, %1885 ]
  %1929 = phi i64 [ %1937, %1927 ], [ 0, %1885 ]
  %1930 = zext i32 %1928 to i64
  %1931 = getelementptr inbounds i8, i8 addrspace(4)* %1881, i64 %1930
  %1932 = load i8, i8 addrspace(4)* %1931, align 1, !tbaa !21
  %1933 = zext i8 %1932 to i64
  %1934 = shl i32 %1928, 3
  %1935 = zext i32 %1934 to i64
  %1936 = shl nuw i64 %1933, %1935
  %1937 = or i64 %1936, %1929
  %1938 = add nuw nsw i32 %1928, 1
  %1939 = icmp eq i32 %1938, %1882
  br i1 %1939, label %1940, label %1927

1940:                                             ; preds = %1927, %1887, %1885
  %1941 = phi i8 addrspace(4)* [ %1926, %1887 ], [ %1881, %1885 ], [ %1881, %1927 ]
  %1942 = phi i32 [ %1925, %1887 ], [ 0, %1885 ], [ 0, %1927 ]
  %1943 = phi i64 [ %1924, %1887 ], [ 0, %1885 ], [ %1937, %1927 ]
  %1944 = icmp ugt i32 %1942, 7
  br i1 %1944, label %1947, label %1945

1945:                                             ; preds = %1940
  %1946 = icmp eq i32 %1942, 0
  br i1 %1946, label %2000, label %1987

1947:                                             ; preds = %1940
  %1948 = load i8, i8 addrspace(4)* %1941, align 1, !tbaa !21
  %1949 = zext i8 %1948 to i64
  %1950 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 1
  %1951 = load i8, i8 addrspace(4)* %1950, align 1, !tbaa !21
  %1952 = zext i8 %1951 to i64
  %1953 = shl nuw nsw i64 %1952, 8
  %1954 = or i64 %1953, %1949
  %1955 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 2
  %1956 = load i8, i8 addrspace(4)* %1955, align 1, !tbaa !21
  %1957 = zext i8 %1956 to i64
  %1958 = shl nuw nsw i64 %1957, 16
  %1959 = or i64 %1954, %1958
  %1960 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 3
  %1961 = load i8, i8 addrspace(4)* %1960, align 1, !tbaa !21
  %1962 = zext i8 %1961 to i64
  %1963 = shl nuw nsw i64 %1962, 24
  %1964 = or i64 %1959, %1963
  %1965 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 4
  %1966 = load i8, i8 addrspace(4)* %1965, align 1, !tbaa !21
  %1967 = zext i8 %1966 to i64
  %1968 = shl nuw nsw i64 %1967, 32
  %1969 = or i64 %1964, %1968
  %1970 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 5
  %1971 = load i8, i8 addrspace(4)* %1970, align 1, !tbaa !21
  %1972 = zext i8 %1971 to i64
  %1973 = shl nuw nsw i64 %1972, 40
  %1974 = or i64 %1969, %1973
  %1975 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 6
  %1976 = load i8, i8 addrspace(4)* %1975, align 1, !tbaa !21
  %1977 = zext i8 %1976 to i64
  %1978 = shl nuw nsw i64 %1977, 48
  %1979 = or i64 %1974, %1978
  %1980 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 7
  %1981 = load i8, i8 addrspace(4)* %1980, align 1, !tbaa !21
  %1982 = zext i8 %1981 to i64
  %1983 = shl nuw i64 %1982, 56
  %1984 = or i64 %1979, %1983
  %1985 = add nsw i32 %1942, -8
  %1986 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 8
  br label %2000

1987:                                             ; preds = %1945, %1987
  %1988 = phi i32 [ %1998, %1987 ], [ 0, %1945 ]
  %1989 = phi i64 [ %1997, %1987 ], [ 0, %1945 ]
  %1990 = zext i32 %1988 to i64
  %1991 = getelementptr inbounds i8, i8 addrspace(4)* %1941, i64 %1990
  %1992 = load i8, i8 addrspace(4)* %1991, align 1, !tbaa !21
  %1993 = zext i8 %1992 to i64
  %1994 = shl i32 %1988, 3
  %1995 = zext i32 %1994 to i64
  %1996 = shl nuw i64 %1993, %1995
  %1997 = or i64 %1996, %1989
  %1998 = add nuw nsw i32 %1988, 1
  %1999 = icmp eq i32 %1998, %1942
  br i1 %1999, label %2000, label %1987

2000:                                             ; preds = %1987, %1947, %1945
  %2001 = phi i8 addrspace(4)* [ %1986, %1947 ], [ %1941, %1945 ], [ %1941, %1987 ]
  %2002 = phi i32 [ %1985, %1947 ], [ 0, %1945 ], [ 0, %1987 ]
  %2003 = phi i64 [ %1984, %1947 ], [ 0, %1945 ], [ %1997, %1987 ]
  %2004 = icmp ugt i32 %2002, 7
  br i1 %2004, label %2007, label %2005

2005:                                             ; preds = %2000
  %2006 = icmp eq i32 %2002, 0
  br i1 %2006, label %2058, label %2045

2007:                                             ; preds = %2000
  %2008 = load i8, i8 addrspace(4)* %2001, align 1, !tbaa !21
  %2009 = zext i8 %2008 to i64
  %2010 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 1
  %2011 = load i8, i8 addrspace(4)* %2010, align 1, !tbaa !21
  %2012 = zext i8 %2011 to i64
  %2013 = shl nuw nsw i64 %2012, 8
  %2014 = or i64 %2013, %2009
  %2015 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 2
  %2016 = load i8, i8 addrspace(4)* %2015, align 1, !tbaa !21
  %2017 = zext i8 %2016 to i64
  %2018 = shl nuw nsw i64 %2017, 16
  %2019 = or i64 %2014, %2018
  %2020 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 3
  %2021 = load i8, i8 addrspace(4)* %2020, align 1, !tbaa !21
  %2022 = zext i8 %2021 to i64
  %2023 = shl nuw nsw i64 %2022, 24
  %2024 = or i64 %2019, %2023
  %2025 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 4
  %2026 = load i8, i8 addrspace(4)* %2025, align 1, !tbaa !21
  %2027 = zext i8 %2026 to i64
  %2028 = shl nuw nsw i64 %2027, 32
  %2029 = or i64 %2024, %2028
  %2030 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 5
  %2031 = load i8, i8 addrspace(4)* %2030, align 1, !tbaa !21
  %2032 = zext i8 %2031 to i64
  %2033 = shl nuw nsw i64 %2032, 40
  %2034 = or i64 %2029, %2033
  %2035 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 6
  %2036 = load i8, i8 addrspace(4)* %2035, align 1, !tbaa !21
  %2037 = zext i8 %2036 to i64
  %2038 = shl nuw nsw i64 %2037, 48
  %2039 = or i64 %2034, %2038
  %2040 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 7
  %2041 = load i8, i8 addrspace(4)* %2040, align 1, !tbaa !21
  %2042 = zext i8 %2041 to i64
  %2043 = shl nuw i64 %2042, 56
  %2044 = or i64 %2039, %2043
  br label %2058

2045:                                             ; preds = %2005, %2045
  %2046 = phi i32 [ %2056, %2045 ], [ 0, %2005 ]
  %2047 = phi i64 [ %2055, %2045 ], [ 0, %2005 ]
  %2048 = zext i32 %2046 to i64
  %2049 = getelementptr inbounds i8, i8 addrspace(4)* %2001, i64 %2048
  %2050 = load i8, i8 addrspace(4)* %2049, align 1, !tbaa !21
  %2051 = zext i8 %2050 to i64
  %2052 = shl i32 %2046, 3
  %2053 = zext i32 %2052 to i64
  %2054 = shl nuw i64 %2051, %2053
  %2055 = or i64 %2054, %2047
  %2056 = add nuw nsw i32 %2046, 1
  %2057 = icmp eq i32 %2056, %2002
  br i1 %2057, label %2058, label %2045

2058:                                             ; preds = %2045, %2007, %2005
  %2059 = phi i64 [ %2044, %2007 ], [ 0, %2005 ], [ %2055, %2045 ]
  %2060 = shl nuw nsw i64 %1641, 2
  %2061 = add nuw nsw i64 %2060, 28
  %2062 = and i64 %2061, 480
  %2063 = and i64 %1643, -225
  %2064 = or i64 %2063, %2062
  %2065 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1621, i32 noundef 2, i64 noundef %2064, i64 noundef %1703, i64 noundef %1763, i64 noundef %1823, i64 noundef %1883, i64 noundef %1943, i64 noundef %2003, i64 noundef %2059) #12
  %2066 = sub i64 %1633, %1641
  %2067 = getelementptr inbounds i8, i8 addrspace(4)* %1634, i64 %1641
  %2068 = icmp eq i64 %2066, 0
  br i1 %2068, label %2069, label %1632

2069:                                             ; preds = %2058, %1624
  %2070 = phi <2 x i64> [ %1627, %1624 ], [ %2065, %2058 ]
  %2071 = extractelement <2 x i64> %2070, i64 0
  %2072 = icmp eq i8 addrspace(1)* %31, addrspacecast (i8* null to i8 addrspace(1)*)
  br i1 %2072, label %2084, label %2073

2073:                                             ; preds = %2069, %2073
  %2074 = phi i8 addrspace(1)* [ %2075, %2073 ], [ %31, %2069 ]
  %2075 = getelementptr i8, i8 addrspace(1)* %2074, i64 1
  %2076 = load i8, i8 addrspace(1)* %2074, align 1
  %2077 = icmp eq i8 %2076, 0
  br i1 %2077, label %2078, label %2073

2078:                                             ; preds = %2073
  %2079 = addrspacecast i8 addrspace(1)* %2074 to i8*
  %2080 = ptrtoint i8* %122 to i64
  %2081 = ptrtoint i8* %2079 to i64
  %2082 = sub i64 %2081, %2080
  %2083 = add i64 %2082, 1
  br label %2084

2084:                                             ; preds = %2078, %2069
  %2085 = phi i64 [ %2083, %2078 ], [ 0, %2069 ]
  br i1 %2072, label %2086, label %2090

2086:                                             ; preds = %2084
  %2087 = and i64 %2071, -225
  %2088 = or i64 %2087, 32
  %2089 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1621, i32 noundef 2, i64 noundef %2088, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2531

2090:                                             ; preds = %2084
  %2091 = and i64 %2071, 2
  %2092 = and i64 %2071, -3
  %2093 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2092, i64 0
  br label %2094

2094:                                             ; preds = %2520, %2090
  %2095 = phi i64 [ %2085, %2090 ], [ %2528, %2520 ]
  %2096 = phi i8 addrspace(1)* [ %31, %2090 ], [ %2529, %2520 ]
  %2097 = phi <2 x i64> [ %2093, %2090 ], [ %2527, %2520 ]
  %2098 = icmp ugt i64 %2095, 56
  %2099 = extractelement <2 x i64> %2097, i64 0
  %2100 = or i64 %2099, %2091
  %2101 = insertelement <2 x i64> poison, i64 %2100, i64 0
  %2102 = select i1 %2098, <2 x i64> %2097, <2 x i64> %2101
  %2103 = tail call i64 @llvm.umin.i64(i64 %2095, i64 56)
  %2104 = trunc i64 %2103 to i32
  %2105 = extractelement <2 x i64> %2102, i64 0
  %2106 = icmp ugt i32 %2104, 7
  br i1 %2106, label %2109, label %2107

2107:                                             ; preds = %2094
  %2108 = icmp eq i32 %2104, 0
  br i1 %2108, label %2162, label %2149

2109:                                             ; preds = %2094
  %2110 = load i8, i8 addrspace(1)* %2096, align 1, !tbaa !21
  %2111 = zext i8 %2110 to i64
  %2112 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 1
  %2113 = load i8, i8 addrspace(1)* %2112, align 1, !tbaa !21
  %2114 = zext i8 %2113 to i64
  %2115 = shl nuw nsw i64 %2114, 8
  %2116 = or i64 %2115, %2111
  %2117 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 2
  %2118 = load i8, i8 addrspace(1)* %2117, align 1, !tbaa !21
  %2119 = zext i8 %2118 to i64
  %2120 = shl nuw nsw i64 %2119, 16
  %2121 = or i64 %2116, %2120
  %2122 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 3
  %2123 = load i8, i8 addrspace(1)* %2122, align 1, !tbaa !21
  %2124 = zext i8 %2123 to i64
  %2125 = shl nuw nsw i64 %2124, 24
  %2126 = or i64 %2121, %2125
  %2127 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 4
  %2128 = load i8, i8 addrspace(1)* %2127, align 1, !tbaa !21
  %2129 = zext i8 %2128 to i64
  %2130 = shl nuw nsw i64 %2129, 32
  %2131 = or i64 %2126, %2130
  %2132 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 5
  %2133 = load i8, i8 addrspace(1)* %2132, align 1, !tbaa !21
  %2134 = zext i8 %2133 to i64
  %2135 = shl nuw nsw i64 %2134, 40
  %2136 = or i64 %2131, %2135
  %2137 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 6
  %2138 = load i8, i8 addrspace(1)* %2137, align 1, !tbaa !21
  %2139 = zext i8 %2138 to i64
  %2140 = shl nuw nsw i64 %2139, 48
  %2141 = or i64 %2136, %2140
  %2142 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 7
  %2143 = load i8, i8 addrspace(1)* %2142, align 1, !tbaa !21
  %2144 = zext i8 %2143 to i64
  %2145 = shl nuw i64 %2144, 56
  %2146 = or i64 %2141, %2145
  %2147 = add nsw i32 %2104, -8
  %2148 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 8
  br label %2162

2149:                                             ; preds = %2107, %2149
  %2150 = phi i32 [ %2160, %2149 ], [ 0, %2107 ]
  %2151 = phi i64 [ %2159, %2149 ], [ 0, %2107 ]
  %2152 = zext i32 %2150 to i64
  %2153 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 %2152
  %2154 = load i8, i8 addrspace(1)* %2153, align 1, !tbaa !21
  %2155 = zext i8 %2154 to i64
  %2156 = shl i32 %2150, 3
  %2157 = zext i32 %2156 to i64
  %2158 = shl nuw i64 %2155, %2157
  %2159 = or i64 %2158, %2151
  %2160 = add nuw nsw i32 %2150, 1
  %2161 = icmp eq i32 %2160, %2104
  br i1 %2161, label %2162, label %2149, !llvm.loop !22

2162:                                             ; preds = %2149, %2109, %2107
  %2163 = phi i8 addrspace(1)* [ %2148, %2109 ], [ %2096, %2107 ], [ %2096, %2149 ]
  %2164 = phi i32 [ %2147, %2109 ], [ 0, %2107 ], [ 0, %2149 ]
  %2165 = phi i64 [ %2146, %2109 ], [ 0, %2107 ], [ %2159, %2149 ]
  %2166 = icmp ugt i32 %2164, 7
  br i1 %2166, label %2169, label %2167

2167:                                             ; preds = %2162
  %2168 = icmp eq i32 %2164, 0
  br i1 %2168, label %2222, label %2209

2169:                                             ; preds = %2162
  %2170 = load i8, i8 addrspace(1)* %2163, align 1, !tbaa !21
  %2171 = zext i8 %2170 to i64
  %2172 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 1
  %2173 = load i8, i8 addrspace(1)* %2172, align 1, !tbaa !21
  %2174 = zext i8 %2173 to i64
  %2175 = shl nuw nsw i64 %2174, 8
  %2176 = or i64 %2175, %2171
  %2177 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 2
  %2178 = load i8, i8 addrspace(1)* %2177, align 1, !tbaa !21
  %2179 = zext i8 %2178 to i64
  %2180 = shl nuw nsw i64 %2179, 16
  %2181 = or i64 %2176, %2180
  %2182 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 3
  %2183 = load i8, i8 addrspace(1)* %2182, align 1, !tbaa !21
  %2184 = zext i8 %2183 to i64
  %2185 = shl nuw nsw i64 %2184, 24
  %2186 = or i64 %2181, %2185
  %2187 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 4
  %2188 = load i8, i8 addrspace(1)* %2187, align 1, !tbaa !21
  %2189 = zext i8 %2188 to i64
  %2190 = shl nuw nsw i64 %2189, 32
  %2191 = or i64 %2186, %2190
  %2192 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 5
  %2193 = load i8, i8 addrspace(1)* %2192, align 1, !tbaa !21
  %2194 = zext i8 %2193 to i64
  %2195 = shl nuw nsw i64 %2194, 40
  %2196 = or i64 %2191, %2195
  %2197 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 6
  %2198 = load i8, i8 addrspace(1)* %2197, align 1, !tbaa !21
  %2199 = zext i8 %2198 to i64
  %2200 = shl nuw nsw i64 %2199, 48
  %2201 = or i64 %2196, %2200
  %2202 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 7
  %2203 = load i8, i8 addrspace(1)* %2202, align 1, !tbaa !21
  %2204 = zext i8 %2203 to i64
  %2205 = shl nuw i64 %2204, 56
  %2206 = or i64 %2201, %2205
  %2207 = add nsw i32 %2164, -8
  %2208 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 8
  br label %2222

2209:                                             ; preds = %2167, %2209
  %2210 = phi i32 [ %2220, %2209 ], [ 0, %2167 ]
  %2211 = phi i64 [ %2219, %2209 ], [ 0, %2167 ]
  %2212 = zext i32 %2210 to i64
  %2213 = getelementptr inbounds i8, i8 addrspace(1)* %2163, i64 %2212
  %2214 = load i8, i8 addrspace(1)* %2213, align 1, !tbaa !21
  %2215 = zext i8 %2214 to i64
  %2216 = shl i32 %2210, 3
  %2217 = zext i32 %2216 to i64
  %2218 = shl nuw i64 %2215, %2217
  %2219 = or i64 %2218, %2211
  %2220 = add nuw nsw i32 %2210, 1
  %2221 = icmp eq i32 %2220, %2164
  br i1 %2221, label %2222, label %2209

2222:                                             ; preds = %2209, %2169, %2167
  %2223 = phi i8 addrspace(1)* [ %2208, %2169 ], [ %2163, %2167 ], [ %2163, %2209 ]
  %2224 = phi i32 [ %2207, %2169 ], [ 0, %2167 ], [ 0, %2209 ]
  %2225 = phi i64 [ %2206, %2169 ], [ 0, %2167 ], [ %2219, %2209 ]
  %2226 = icmp ugt i32 %2224, 7
  br i1 %2226, label %2229, label %2227

2227:                                             ; preds = %2222
  %2228 = icmp eq i32 %2224, 0
  br i1 %2228, label %2282, label %2269

2229:                                             ; preds = %2222
  %2230 = load i8, i8 addrspace(1)* %2223, align 1, !tbaa !21
  %2231 = zext i8 %2230 to i64
  %2232 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 1
  %2233 = load i8, i8 addrspace(1)* %2232, align 1, !tbaa !21
  %2234 = zext i8 %2233 to i64
  %2235 = shl nuw nsw i64 %2234, 8
  %2236 = or i64 %2235, %2231
  %2237 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 2
  %2238 = load i8, i8 addrspace(1)* %2237, align 1, !tbaa !21
  %2239 = zext i8 %2238 to i64
  %2240 = shl nuw nsw i64 %2239, 16
  %2241 = or i64 %2236, %2240
  %2242 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 3
  %2243 = load i8, i8 addrspace(1)* %2242, align 1, !tbaa !21
  %2244 = zext i8 %2243 to i64
  %2245 = shl nuw nsw i64 %2244, 24
  %2246 = or i64 %2241, %2245
  %2247 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 4
  %2248 = load i8, i8 addrspace(1)* %2247, align 1, !tbaa !21
  %2249 = zext i8 %2248 to i64
  %2250 = shl nuw nsw i64 %2249, 32
  %2251 = or i64 %2246, %2250
  %2252 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 5
  %2253 = load i8, i8 addrspace(1)* %2252, align 1, !tbaa !21
  %2254 = zext i8 %2253 to i64
  %2255 = shl nuw nsw i64 %2254, 40
  %2256 = or i64 %2251, %2255
  %2257 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 6
  %2258 = load i8, i8 addrspace(1)* %2257, align 1, !tbaa !21
  %2259 = zext i8 %2258 to i64
  %2260 = shl nuw nsw i64 %2259, 48
  %2261 = or i64 %2256, %2260
  %2262 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 7
  %2263 = load i8, i8 addrspace(1)* %2262, align 1, !tbaa !21
  %2264 = zext i8 %2263 to i64
  %2265 = shl nuw i64 %2264, 56
  %2266 = or i64 %2261, %2265
  %2267 = add nsw i32 %2224, -8
  %2268 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 8
  br label %2282

2269:                                             ; preds = %2227, %2269
  %2270 = phi i32 [ %2280, %2269 ], [ 0, %2227 ]
  %2271 = phi i64 [ %2279, %2269 ], [ 0, %2227 ]
  %2272 = zext i32 %2270 to i64
  %2273 = getelementptr inbounds i8, i8 addrspace(1)* %2223, i64 %2272
  %2274 = load i8, i8 addrspace(1)* %2273, align 1, !tbaa !21
  %2275 = zext i8 %2274 to i64
  %2276 = shl i32 %2270, 3
  %2277 = zext i32 %2276 to i64
  %2278 = shl nuw i64 %2275, %2277
  %2279 = or i64 %2278, %2271
  %2280 = add nuw nsw i32 %2270, 1
  %2281 = icmp eq i32 %2280, %2224
  br i1 %2281, label %2282, label %2269

2282:                                             ; preds = %2269, %2229, %2227
  %2283 = phi i8 addrspace(1)* [ %2268, %2229 ], [ %2223, %2227 ], [ %2223, %2269 ]
  %2284 = phi i32 [ %2267, %2229 ], [ 0, %2227 ], [ 0, %2269 ]
  %2285 = phi i64 [ %2266, %2229 ], [ 0, %2227 ], [ %2279, %2269 ]
  %2286 = icmp ugt i32 %2284, 7
  br i1 %2286, label %2289, label %2287

2287:                                             ; preds = %2282
  %2288 = icmp eq i32 %2284, 0
  br i1 %2288, label %2342, label %2329

2289:                                             ; preds = %2282
  %2290 = load i8, i8 addrspace(1)* %2283, align 1, !tbaa !21
  %2291 = zext i8 %2290 to i64
  %2292 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 1
  %2293 = load i8, i8 addrspace(1)* %2292, align 1, !tbaa !21
  %2294 = zext i8 %2293 to i64
  %2295 = shl nuw nsw i64 %2294, 8
  %2296 = or i64 %2295, %2291
  %2297 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 2
  %2298 = load i8, i8 addrspace(1)* %2297, align 1, !tbaa !21
  %2299 = zext i8 %2298 to i64
  %2300 = shl nuw nsw i64 %2299, 16
  %2301 = or i64 %2296, %2300
  %2302 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 3
  %2303 = load i8, i8 addrspace(1)* %2302, align 1, !tbaa !21
  %2304 = zext i8 %2303 to i64
  %2305 = shl nuw nsw i64 %2304, 24
  %2306 = or i64 %2301, %2305
  %2307 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 4
  %2308 = load i8, i8 addrspace(1)* %2307, align 1, !tbaa !21
  %2309 = zext i8 %2308 to i64
  %2310 = shl nuw nsw i64 %2309, 32
  %2311 = or i64 %2306, %2310
  %2312 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 5
  %2313 = load i8, i8 addrspace(1)* %2312, align 1, !tbaa !21
  %2314 = zext i8 %2313 to i64
  %2315 = shl nuw nsw i64 %2314, 40
  %2316 = or i64 %2311, %2315
  %2317 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 6
  %2318 = load i8, i8 addrspace(1)* %2317, align 1, !tbaa !21
  %2319 = zext i8 %2318 to i64
  %2320 = shl nuw nsw i64 %2319, 48
  %2321 = or i64 %2316, %2320
  %2322 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 7
  %2323 = load i8, i8 addrspace(1)* %2322, align 1, !tbaa !21
  %2324 = zext i8 %2323 to i64
  %2325 = shl nuw i64 %2324, 56
  %2326 = or i64 %2321, %2325
  %2327 = add nsw i32 %2284, -8
  %2328 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 8
  br label %2342

2329:                                             ; preds = %2287, %2329
  %2330 = phi i32 [ %2340, %2329 ], [ 0, %2287 ]
  %2331 = phi i64 [ %2339, %2329 ], [ 0, %2287 ]
  %2332 = zext i32 %2330 to i64
  %2333 = getelementptr inbounds i8, i8 addrspace(1)* %2283, i64 %2332
  %2334 = load i8, i8 addrspace(1)* %2333, align 1, !tbaa !21
  %2335 = zext i8 %2334 to i64
  %2336 = shl i32 %2330, 3
  %2337 = zext i32 %2336 to i64
  %2338 = shl nuw i64 %2335, %2337
  %2339 = or i64 %2338, %2331
  %2340 = add nuw nsw i32 %2330, 1
  %2341 = icmp eq i32 %2340, %2284
  br i1 %2341, label %2342, label %2329

2342:                                             ; preds = %2329, %2289, %2287
  %2343 = phi i8 addrspace(1)* [ %2328, %2289 ], [ %2283, %2287 ], [ %2283, %2329 ]
  %2344 = phi i32 [ %2327, %2289 ], [ 0, %2287 ], [ 0, %2329 ]
  %2345 = phi i64 [ %2326, %2289 ], [ 0, %2287 ], [ %2339, %2329 ]
  %2346 = icmp ugt i32 %2344, 7
  br i1 %2346, label %2349, label %2347

2347:                                             ; preds = %2342
  %2348 = icmp eq i32 %2344, 0
  br i1 %2348, label %2402, label %2389

2349:                                             ; preds = %2342
  %2350 = load i8, i8 addrspace(1)* %2343, align 1, !tbaa !21
  %2351 = zext i8 %2350 to i64
  %2352 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 1
  %2353 = load i8, i8 addrspace(1)* %2352, align 1, !tbaa !21
  %2354 = zext i8 %2353 to i64
  %2355 = shl nuw nsw i64 %2354, 8
  %2356 = or i64 %2355, %2351
  %2357 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 2
  %2358 = load i8, i8 addrspace(1)* %2357, align 1, !tbaa !21
  %2359 = zext i8 %2358 to i64
  %2360 = shl nuw nsw i64 %2359, 16
  %2361 = or i64 %2356, %2360
  %2362 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 3
  %2363 = load i8, i8 addrspace(1)* %2362, align 1, !tbaa !21
  %2364 = zext i8 %2363 to i64
  %2365 = shl nuw nsw i64 %2364, 24
  %2366 = or i64 %2361, %2365
  %2367 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 4
  %2368 = load i8, i8 addrspace(1)* %2367, align 1, !tbaa !21
  %2369 = zext i8 %2368 to i64
  %2370 = shl nuw nsw i64 %2369, 32
  %2371 = or i64 %2366, %2370
  %2372 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 5
  %2373 = load i8, i8 addrspace(1)* %2372, align 1, !tbaa !21
  %2374 = zext i8 %2373 to i64
  %2375 = shl nuw nsw i64 %2374, 40
  %2376 = or i64 %2371, %2375
  %2377 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 6
  %2378 = load i8, i8 addrspace(1)* %2377, align 1, !tbaa !21
  %2379 = zext i8 %2378 to i64
  %2380 = shl nuw nsw i64 %2379, 48
  %2381 = or i64 %2376, %2380
  %2382 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 7
  %2383 = load i8, i8 addrspace(1)* %2382, align 1, !tbaa !21
  %2384 = zext i8 %2383 to i64
  %2385 = shl nuw i64 %2384, 56
  %2386 = or i64 %2381, %2385
  %2387 = add nsw i32 %2344, -8
  %2388 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 8
  br label %2402

2389:                                             ; preds = %2347, %2389
  %2390 = phi i32 [ %2400, %2389 ], [ 0, %2347 ]
  %2391 = phi i64 [ %2399, %2389 ], [ 0, %2347 ]
  %2392 = zext i32 %2390 to i64
  %2393 = getelementptr inbounds i8, i8 addrspace(1)* %2343, i64 %2392
  %2394 = load i8, i8 addrspace(1)* %2393, align 1, !tbaa !21
  %2395 = zext i8 %2394 to i64
  %2396 = shl i32 %2390, 3
  %2397 = zext i32 %2396 to i64
  %2398 = shl nuw i64 %2395, %2397
  %2399 = or i64 %2398, %2391
  %2400 = add nuw nsw i32 %2390, 1
  %2401 = icmp eq i32 %2400, %2344
  br i1 %2401, label %2402, label %2389

2402:                                             ; preds = %2389, %2349, %2347
  %2403 = phi i8 addrspace(1)* [ %2388, %2349 ], [ %2343, %2347 ], [ %2343, %2389 ]
  %2404 = phi i32 [ %2387, %2349 ], [ 0, %2347 ], [ 0, %2389 ]
  %2405 = phi i64 [ %2386, %2349 ], [ 0, %2347 ], [ %2399, %2389 ]
  %2406 = icmp ugt i32 %2404, 7
  br i1 %2406, label %2409, label %2407

2407:                                             ; preds = %2402
  %2408 = icmp eq i32 %2404, 0
  br i1 %2408, label %2462, label %2449

2409:                                             ; preds = %2402
  %2410 = load i8, i8 addrspace(1)* %2403, align 1, !tbaa !21
  %2411 = zext i8 %2410 to i64
  %2412 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 1
  %2413 = load i8, i8 addrspace(1)* %2412, align 1, !tbaa !21
  %2414 = zext i8 %2413 to i64
  %2415 = shl nuw nsw i64 %2414, 8
  %2416 = or i64 %2415, %2411
  %2417 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 2
  %2418 = load i8, i8 addrspace(1)* %2417, align 1, !tbaa !21
  %2419 = zext i8 %2418 to i64
  %2420 = shl nuw nsw i64 %2419, 16
  %2421 = or i64 %2416, %2420
  %2422 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 3
  %2423 = load i8, i8 addrspace(1)* %2422, align 1, !tbaa !21
  %2424 = zext i8 %2423 to i64
  %2425 = shl nuw nsw i64 %2424, 24
  %2426 = or i64 %2421, %2425
  %2427 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 4
  %2428 = load i8, i8 addrspace(1)* %2427, align 1, !tbaa !21
  %2429 = zext i8 %2428 to i64
  %2430 = shl nuw nsw i64 %2429, 32
  %2431 = or i64 %2426, %2430
  %2432 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 5
  %2433 = load i8, i8 addrspace(1)* %2432, align 1, !tbaa !21
  %2434 = zext i8 %2433 to i64
  %2435 = shl nuw nsw i64 %2434, 40
  %2436 = or i64 %2431, %2435
  %2437 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 6
  %2438 = load i8, i8 addrspace(1)* %2437, align 1, !tbaa !21
  %2439 = zext i8 %2438 to i64
  %2440 = shl nuw nsw i64 %2439, 48
  %2441 = or i64 %2436, %2440
  %2442 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 7
  %2443 = load i8, i8 addrspace(1)* %2442, align 1, !tbaa !21
  %2444 = zext i8 %2443 to i64
  %2445 = shl nuw i64 %2444, 56
  %2446 = or i64 %2441, %2445
  %2447 = add nsw i32 %2404, -8
  %2448 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 8
  br label %2462

2449:                                             ; preds = %2407, %2449
  %2450 = phi i32 [ %2460, %2449 ], [ 0, %2407 ]
  %2451 = phi i64 [ %2459, %2449 ], [ 0, %2407 ]
  %2452 = zext i32 %2450 to i64
  %2453 = getelementptr inbounds i8, i8 addrspace(1)* %2403, i64 %2452
  %2454 = load i8, i8 addrspace(1)* %2453, align 1, !tbaa !21
  %2455 = zext i8 %2454 to i64
  %2456 = shl i32 %2450, 3
  %2457 = zext i32 %2456 to i64
  %2458 = shl nuw i64 %2455, %2457
  %2459 = or i64 %2458, %2451
  %2460 = add nuw nsw i32 %2450, 1
  %2461 = icmp eq i32 %2460, %2404
  br i1 %2461, label %2462, label %2449

2462:                                             ; preds = %2449, %2409, %2407
  %2463 = phi i8 addrspace(1)* [ %2448, %2409 ], [ %2403, %2407 ], [ %2403, %2449 ]
  %2464 = phi i32 [ %2447, %2409 ], [ 0, %2407 ], [ 0, %2449 ]
  %2465 = phi i64 [ %2446, %2409 ], [ 0, %2407 ], [ %2459, %2449 ]
  %2466 = icmp ugt i32 %2464, 7
  br i1 %2466, label %2469, label %2467

2467:                                             ; preds = %2462
  %2468 = icmp eq i32 %2464, 0
  br i1 %2468, label %2520, label %2507

2469:                                             ; preds = %2462
  %2470 = load i8, i8 addrspace(1)* %2463, align 1, !tbaa !21
  %2471 = zext i8 %2470 to i64
  %2472 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 1
  %2473 = load i8, i8 addrspace(1)* %2472, align 1, !tbaa !21
  %2474 = zext i8 %2473 to i64
  %2475 = shl nuw nsw i64 %2474, 8
  %2476 = or i64 %2475, %2471
  %2477 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 2
  %2478 = load i8, i8 addrspace(1)* %2477, align 1, !tbaa !21
  %2479 = zext i8 %2478 to i64
  %2480 = shl nuw nsw i64 %2479, 16
  %2481 = or i64 %2476, %2480
  %2482 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 3
  %2483 = load i8, i8 addrspace(1)* %2482, align 1, !tbaa !21
  %2484 = zext i8 %2483 to i64
  %2485 = shl nuw nsw i64 %2484, 24
  %2486 = or i64 %2481, %2485
  %2487 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 4
  %2488 = load i8, i8 addrspace(1)* %2487, align 1, !tbaa !21
  %2489 = zext i8 %2488 to i64
  %2490 = shl nuw nsw i64 %2489, 32
  %2491 = or i64 %2486, %2490
  %2492 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 5
  %2493 = load i8, i8 addrspace(1)* %2492, align 1, !tbaa !21
  %2494 = zext i8 %2493 to i64
  %2495 = shl nuw nsw i64 %2494, 40
  %2496 = or i64 %2491, %2495
  %2497 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 6
  %2498 = load i8, i8 addrspace(1)* %2497, align 1, !tbaa !21
  %2499 = zext i8 %2498 to i64
  %2500 = shl nuw nsw i64 %2499, 48
  %2501 = or i64 %2496, %2500
  %2502 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 7
  %2503 = load i8, i8 addrspace(1)* %2502, align 1, !tbaa !21
  %2504 = zext i8 %2503 to i64
  %2505 = shl nuw i64 %2504, 56
  %2506 = or i64 %2501, %2505
  br label %2520

2507:                                             ; preds = %2467, %2507
  %2508 = phi i32 [ %2518, %2507 ], [ 0, %2467 ]
  %2509 = phi i64 [ %2517, %2507 ], [ 0, %2467 ]
  %2510 = zext i32 %2508 to i64
  %2511 = getelementptr inbounds i8, i8 addrspace(1)* %2463, i64 %2510
  %2512 = load i8, i8 addrspace(1)* %2511, align 1, !tbaa !21
  %2513 = zext i8 %2512 to i64
  %2514 = shl i32 %2508, 3
  %2515 = zext i32 %2514 to i64
  %2516 = shl nuw i64 %2513, %2515
  %2517 = or i64 %2516, %2509
  %2518 = add nuw nsw i32 %2508, 1
  %2519 = icmp eq i32 %2518, %2464
  br i1 %2519, label %2520, label %2507

2520:                                             ; preds = %2507, %2469, %2467
  %2521 = phi i64 [ %2506, %2469 ], [ 0, %2467 ], [ %2517, %2507 ]
  %2522 = shl nuw nsw i64 %2103, 2
  %2523 = add nuw nsw i64 %2522, 28
  %2524 = and i64 %2523, 480
  %2525 = and i64 %2105, -225
  %2526 = or i64 %2525, %2524
  %2527 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1621, i32 noundef 2, i64 noundef %2526, i64 noundef %2165, i64 noundef %2225, i64 noundef %2285, i64 noundef %2345, i64 noundef %2405, i64 noundef %2465, i64 noundef %2521) #12
  %2528 = sub i64 %2095, %2103
  %2529 = getelementptr inbounds i8, i8 addrspace(1)* %2096, i64 %2103
  %2530 = icmp eq i64 %2528, 0
  br i1 %2530, label %2531, label %2094

2531:                                             ; preds = %2520, %2086
  %2532 = phi <2 x i64> [ %2089, %2086 ], [ %2527, %2520 ]
  %2533 = extractelement <2 x i64> %2532, i64 0
  %2534 = zext i32 %0 to i64
  %2535 = and i64 %2533, -227
  %2536 = or i64 %2535, 34
  %2537 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1621, i32 noundef 2, i64 noundef %2536, i64 noundef %2534, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %2538

2538:                                             ; preds = %2531, %1612
  %2539 = add nsw i32 %114, -1
  %2540 = sext i32 %2539 to i64
  %2541 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2540
  %2542 = load i8, i8 addrspace(1)* %2541, align 1, !tbaa !7
  %2543 = icmp eq i8 %2542, 32
  br i1 %2543, label %2544, label %3650

2544:                                             ; preds = %2538
  %2545 = zext i32 %119 to i64
  %2546 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %2545) #12
  %2547 = addrspacecast i8 addrspace(1)* %2546 to i8*
  %2548 = ptrtoint i8 addrspace(1)* %2546 to i64
  br i1 %123, label %2637, label %2549

2549:                                             ; preds = %2544
  %2550 = and i32 %114, 7
  %2551 = icmp eq i32 %2550, 0
  br i1 %2551, label %2565, label %2552

2552:                                             ; preds = %2549, %2552
  %2553 = phi i32 [ %2562, %2552 ], [ %2539, %2549 ]
  %2554 = phi i32 [ %2563, %2552 ], [ 0, %2549 ]
  %2555 = zext i32 %2553 to i64
  %2556 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2555
  %2557 = load i8, i8 addrspace(1)* %2556, align 1, !tbaa !7
  %2558 = xor i32 %2553, -1
  %2559 = add i32 %114, %2558
  %2560 = sext i32 %2559 to i64
  %2561 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2560
  store i8 %2557, i8 addrspace(1)* %2561, align 1, !tbaa !7
  %2562 = add nsw i32 %2553, -1
  %2563 = add i32 %2554, 1
  %2564 = icmp eq i32 %2563, %2550
  br i1 %2564, label %2565, label %2552, !llvm.loop !25

2565:                                             ; preds = %2552, %2549
  %2566 = phi i32 [ %2539, %2549 ], [ %2562, %2552 ]
  %2567 = icmp ult i32 %114, 8
  br i1 %2567, label %2568, label %2660

2568:                                             ; preds = %2660, %2565
  %2569 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %121
  store i8 0, i8 addrspace(1)* %2569, align 1, !tbaa !7
  br i1 %123, label %2657, label %2570

2570:                                             ; preds = %2568
  %2571 = and i32 %114, 7
  %2572 = icmp ult i32 %114, 8
  br i1 %2572, label %2639, label %2573

2573:                                             ; preds = %2570
  %2574 = and i32 %114, 2147483640
  br label %2575

2575:                                             ; preds = %2575, %2573
  %2576 = phi i32 [ 0, %2573 ], [ %2634, %2575 ]
  %2577 = phi i32 [ 0, %2573 ], [ %2633, %2575 ]
  %2578 = phi i32 [ 0, %2573 ], [ %2635, %2575 ]
  %2579 = mul nsw i32 %2577, 31
  %2580 = zext i32 %2576 to i64
  %2581 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2580
  %2582 = load i8, i8 addrspace(1)* %2581, align 1, !tbaa !7
  %2583 = sext i8 %2582 to i32
  %2584 = add nsw i32 %2579, %2583
  %2585 = or i32 %2576, 1
  %2586 = mul nsw i32 %2584, 31
  %2587 = zext i32 %2585 to i64
  %2588 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2587
  %2589 = load i8, i8 addrspace(1)* %2588, align 1, !tbaa !7
  %2590 = sext i8 %2589 to i32
  %2591 = add nsw i32 %2586, %2590
  %2592 = or i32 %2576, 2
  %2593 = mul nsw i32 %2591, 31
  %2594 = zext i32 %2592 to i64
  %2595 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2594
  %2596 = load i8, i8 addrspace(1)* %2595, align 1, !tbaa !7
  %2597 = sext i8 %2596 to i32
  %2598 = add nsw i32 %2593, %2597
  %2599 = or i32 %2576, 3
  %2600 = mul nsw i32 %2598, 31
  %2601 = zext i32 %2599 to i64
  %2602 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2601
  %2603 = load i8, i8 addrspace(1)* %2602, align 1, !tbaa !7
  %2604 = sext i8 %2603 to i32
  %2605 = add nsw i32 %2600, %2604
  %2606 = or i32 %2576, 4
  %2607 = mul nsw i32 %2605, 31
  %2608 = zext i32 %2606 to i64
  %2609 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2608
  %2610 = load i8, i8 addrspace(1)* %2609, align 1, !tbaa !7
  %2611 = sext i8 %2610 to i32
  %2612 = add nsw i32 %2607, %2611
  %2613 = or i32 %2576, 5
  %2614 = mul nsw i32 %2612, 31
  %2615 = zext i32 %2613 to i64
  %2616 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2615
  %2617 = load i8, i8 addrspace(1)* %2616, align 1, !tbaa !7
  %2618 = sext i8 %2617 to i32
  %2619 = add nsw i32 %2614, %2618
  %2620 = or i32 %2576, 6
  %2621 = mul nsw i32 %2619, 31
  %2622 = zext i32 %2620 to i64
  %2623 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2622
  %2624 = load i8, i8 addrspace(1)* %2623, align 1, !tbaa !7
  %2625 = sext i8 %2624 to i32
  %2626 = add nsw i32 %2621, %2625
  %2627 = or i32 %2576, 7
  %2628 = mul nsw i32 %2626, 31
  %2629 = zext i32 %2627 to i64
  %2630 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2629
  %2631 = load i8, i8 addrspace(1)* %2630, align 1, !tbaa !7
  %2632 = sext i8 %2631 to i32
  %2633 = add nsw i32 %2628, %2632
  %2634 = add nuw nsw i32 %2576, 8
  %2635 = add i32 %2578, 8
  %2636 = icmp eq i32 %2635, %2574
  br i1 %2636, label %2639, label %2575, !llvm.loop !23

2637:                                             ; preds = %2544
  %2638 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %121
  store i8 0, i8 addrspace(1)* %2638, align 1, !tbaa !7
  br label %2657

2639:                                             ; preds = %2575, %2570
  %2640 = phi i32 [ undef, %2570 ], [ %2633, %2575 ]
  %2641 = phi i32 [ 0, %2570 ], [ %2634, %2575 ]
  %2642 = phi i32 [ 0, %2570 ], [ %2633, %2575 ]
  %2643 = icmp eq i32 %2571, 0
  br i1 %2643, label %2657, label %2644

2644:                                             ; preds = %2639, %2644
  %2645 = phi i32 [ %2654, %2644 ], [ %2641, %2639 ]
  %2646 = phi i32 [ %2653, %2644 ], [ %2642, %2639 ]
  %2647 = phi i32 [ %2655, %2644 ], [ 0, %2639 ]
  %2648 = mul nsw i32 %2646, 31
  %2649 = zext i32 %2645 to i64
  %2650 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2649
  %2651 = load i8, i8 addrspace(1)* %2650, align 1, !tbaa !7
  %2652 = sext i8 %2651 to i32
  %2653 = add nsw i32 %2648, %2652
  %2654 = add nuw nsw i32 %2645, 1
  %2655 = add i32 %2647, 1
  %2656 = icmp eq i32 %2655, %2571
  br i1 %2656, label %2657, label %2644, !llvm.loop !26

2657:                                             ; preds = %2639, %2644, %2637, %2568
  %2658 = phi i32 [ 0, %2568 ], [ 0, %2637 ], [ %2640, %2639 ], [ %2653, %2644 ]
  %2659 = icmp eq i32 %2658, %0
  br i1 %2659, label %2726, label %3649

2660:                                             ; preds = %2565, %2660
  %2661 = phi i32 [ %2724, %2660 ], [ %2566, %2565 ]
  %2662 = zext i32 %2661 to i64
  %2663 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2662
  %2664 = load i8, i8 addrspace(1)* %2663, align 1, !tbaa !7
  %2665 = xor i32 %2661, -1
  %2666 = add i32 %114, %2665
  %2667 = sext i32 %2666 to i64
  %2668 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2667
  store i8 %2664, i8 addrspace(1)* %2668, align 1, !tbaa !7
  %2669 = add nsw i32 %2661, -1
  %2670 = zext i32 %2669 to i64
  %2671 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2670
  %2672 = load i8, i8 addrspace(1)* %2671, align 1, !tbaa !7
  %2673 = sub i32 %114, %2661
  %2674 = sext i32 %2673 to i64
  %2675 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2674
  store i8 %2672, i8 addrspace(1)* %2675, align 1, !tbaa !7
  %2676 = add nsw i32 %2661, -2
  %2677 = zext i32 %2676 to i64
  %2678 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2677
  %2679 = load i8, i8 addrspace(1)* %2678, align 1, !tbaa !7
  %2680 = sub i32 1, %2661
  %2681 = add i32 %114, %2680
  %2682 = sext i32 %2681 to i64
  %2683 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2682
  store i8 %2679, i8 addrspace(1)* %2683, align 1, !tbaa !7
  %2684 = add nsw i32 %2661, -3
  %2685 = zext i32 %2684 to i64
  %2686 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2685
  %2687 = load i8, i8 addrspace(1)* %2686, align 1, !tbaa !7
  %2688 = sub i32 2, %2661
  %2689 = add i32 %114, %2688
  %2690 = sext i32 %2689 to i64
  %2691 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2690
  store i8 %2687, i8 addrspace(1)* %2691, align 1, !tbaa !7
  %2692 = add nsw i32 %2661, -4
  %2693 = zext i32 %2692 to i64
  %2694 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2693
  %2695 = load i8, i8 addrspace(1)* %2694, align 1, !tbaa !7
  %2696 = sub i32 3, %2661
  %2697 = add i32 %114, %2696
  %2698 = sext i32 %2697 to i64
  %2699 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2698
  store i8 %2695, i8 addrspace(1)* %2699, align 1, !tbaa !7
  %2700 = add nsw i32 %2661, -5
  %2701 = zext i32 %2700 to i64
  %2702 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2701
  %2703 = load i8, i8 addrspace(1)* %2702, align 1, !tbaa !7
  %2704 = sub i32 4, %2661
  %2705 = add i32 %114, %2704
  %2706 = sext i32 %2705 to i64
  %2707 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2706
  store i8 %2703, i8 addrspace(1)* %2707, align 1, !tbaa !7
  %2708 = add nsw i32 %2661, -6
  %2709 = zext i32 %2708 to i64
  %2710 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2709
  %2711 = load i8, i8 addrspace(1)* %2710, align 1, !tbaa !7
  %2712 = sub i32 5, %2661
  %2713 = add i32 %114, %2712
  %2714 = sext i32 %2713 to i64
  %2715 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2714
  store i8 %2711, i8 addrspace(1)* %2715, align 1, !tbaa !7
  %2716 = add nsw i32 %2661, -7
  %2717 = zext i32 %2716 to i64
  %2718 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 %2717
  %2719 = load i8, i8 addrspace(1)* %2718, align 1, !tbaa !7
  %2720 = sub i32 6, %2661
  %2721 = add i32 %114, %2720
  %2722 = sext i32 %2721 to i64
  %2723 = getelementptr inbounds i8, i8 addrspace(1)* %2546, i64 %2722
  store i8 %2719, i8 addrspace(1)* %2723, align 1, !tbaa !7
  %2724 = add nsw i32 %2661, -8
  %2725 = icmp sgt i32 %2661, 7
  br i1 %2725, label %2660, label %2568, !llvm.loop !27

2726:                                             ; preds = %2657
  %2727 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %2728 = getelementptr inbounds i8, i8 addrspace(4)* %2727, i64 24
  %2729 = bitcast i8 addrspace(4)* %2728 to i64 addrspace(4)*
  %2730 = load i64, i64 addrspace(4)* %2729, align 8, !tbaa !17
  %2731 = inttoptr i64 %2730 to i8 addrspace(1)*
  %2732 = addrspacecast i8 addrspace(1)* %2731 to i8*
  %2733 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2732, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %2734 = extractelement <2 x i64> %2733, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %2735, label %2739

2735:                                             ; preds = %2726
  %2736 = and i64 %2734, -225
  %2737 = or i64 %2736, 32
  %2738 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2732, i32 noundef 2, i64 noundef %2737, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %3180

2739:                                             ; preds = %2726
  %2740 = and i64 %2734, 2
  %2741 = and i64 %2734, -3
  %2742 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2741, i64 0
  br label %2743

2743:                                             ; preds = %3169, %2739
  %2744 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 49) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([50 x i8]* addrspacecast ([50 x i8] addrspace(4)* @.str.2 to [50 x i8]*) to i64)), i64 1))), %2739 ], [ %3177, %3169 ]
  %2745 = phi i8 addrspace(4)* [ getelementptr inbounds ([50 x i8], [50 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %2739 ], [ %3178, %3169 ]
  %2746 = phi <2 x i64> [ %2742, %2739 ], [ %3176, %3169 ]
  %2747 = icmp ugt i64 %2744, 56
  %2748 = extractelement <2 x i64> %2746, i64 0
  %2749 = or i64 %2748, %2740
  %2750 = insertelement <2 x i64> poison, i64 %2749, i64 0
  %2751 = select i1 %2747, <2 x i64> %2746, <2 x i64> %2750
  %2752 = tail call i64 @llvm.umin.i64(i64 %2744, i64 56)
  %2753 = trunc i64 %2752 to i32
  %2754 = extractelement <2 x i64> %2751, i64 0
  %2755 = icmp ugt i32 %2753, 7
  br i1 %2755, label %2758, label %2756

2756:                                             ; preds = %2743
  %2757 = icmp eq i32 %2753, 0
  br i1 %2757, label %2811, label %2798

2758:                                             ; preds = %2743
  %2759 = load i8, i8 addrspace(4)* %2745, align 1, !tbaa !21
  %2760 = zext i8 %2759 to i64
  %2761 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 1
  %2762 = load i8, i8 addrspace(4)* %2761, align 1, !tbaa !21
  %2763 = zext i8 %2762 to i64
  %2764 = shl nuw nsw i64 %2763, 8
  %2765 = or i64 %2764, %2760
  %2766 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 2
  %2767 = load i8, i8 addrspace(4)* %2766, align 1, !tbaa !21
  %2768 = zext i8 %2767 to i64
  %2769 = shl nuw nsw i64 %2768, 16
  %2770 = or i64 %2765, %2769
  %2771 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 3
  %2772 = load i8, i8 addrspace(4)* %2771, align 1, !tbaa !21
  %2773 = zext i8 %2772 to i64
  %2774 = shl nuw nsw i64 %2773, 24
  %2775 = or i64 %2770, %2774
  %2776 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 4
  %2777 = load i8, i8 addrspace(4)* %2776, align 1, !tbaa !21
  %2778 = zext i8 %2777 to i64
  %2779 = shl nuw nsw i64 %2778, 32
  %2780 = or i64 %2775, %2779
  %2781 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 5
  %2782 = load i8, i8 addrspace(4)* %2781, align 1, !tbaa !21
  %2783 = zext i8 %2782 to i64
  %2784 = shl nuw nsw i64 %2783, 40
  %2785 = or i64 %2780, %2784
  %2786 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 6
  %2787 = load i8, i8 addrspace(4)* %2786, align 1, !tbaa !21
  %2788 = zext i8 %2787 to i64
  %2789 = shl nuw nsw i64 %2788, 48
  %2790 = or i64 %2785, %2789
  %2791 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 7
  %2792 = load i8, i8 addrspace(4)* %2791, align 1, !tbaa !21
  %2793 = zext i8 %2792 to i64
  %2794 = shl nuw i64 %2793, 56
  %2795 = or i64 %2790, %2794
  %2796 = add nsw i32 %2753, -8
  %2797 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 8
  br label %2811

2798:                                             ; preds = %2756, %2798
  %2799 = phi i32 [ %2809, %2798 ], [ 0, %2756 ]
  %2800 = phi i64 [ %2808, %2798 ], [ 0, %2756 ]
  %2801 = zext i32 %2799 to i64
  %2802 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 %2801
  %2803 = load i8, i8 addrspace(4)* %2802, align 1, !tbaa !21
  %2804 = zext i8 %2803 to i64
  %2805 = shl i32 %2799, 3
  %2806 = zext i32 %2805 to i64
  %2807 = shl nuw i64 %2804, %2806
  %2808 = or i64 %2807, %2800
  %2809 = add nuw nsw i32 %2799, 1
  %2810 = icmp eq i32 %2809, %2753
  br i1 %2810, label %2811, label %2798, !llvm.loop !22

2811:                                             ; preds = %2798, %2758, %2756
  %2812 = phi i8 addrspace(4)* [ %2797, %2758 ], [ %2745, %2756 ], [ %2745, %2798 ]
  %2813 = phi i32 [ %2796, %2758 ], [ 0, %2756 ], [ 0, %2798 ]
  %2814 = phi i64 [ %2795, %2758 ], [ 0, %2756 ], [ %2808, %2798 ]
  %2815 = icmp ugt i32 %2813, 7
  br i1 %2815, label %2818, label %2816

2816:                                             ; preds = %2811
  %2817 = icmp eq i32 %2813, 0
  br i1 %2817, label %2871, label %2858

2818:                                             ; preds = %2811
  %2819 = load i8, i8 addrspace(4)* %2812, align 1, !tbaa !21
  %2820 = zext i8 %2819 to i64
  %2821 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 1
  %2822 = load i8, i8 addrspace(4)* %2821, align 1, !tbaa !21
  %2823 = zext i8 %2822 to i64
  %2824 = shl nuw nsw i64 %2823, 8
  %2825 = or i64 %2824, %2820
  %2826 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 2
  %2827 = load i8, i8 addrspace(4)* %2826, align 1, !tbaa !21
  %2828 = zext i8 %2827 to i64
  %2829 = shl nuw nsw i64 %2828, 16
  %2830 = or i64 %2825, %2829
  %2831 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 3
  %2832 = load i8, i8 addrspace(4)* %2831, align 1, !tbaa !21
  %2833 = zext i8 %2832 to i64
  %2834 = shl nuw nsw i64 %2833, 24
  %2835 = or i64 %2830, %2834
  %2836 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 4
  %2837 = load i8, i8 addrspace(4)* %2836, align 1, !tbaa !21
  %2838 = zext i8 %2837 to i64
  %2839 = shl nuw nsw i64 %2838, 32
  %2840 = or i64 %2835, %2839
  %2841 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 5
  %2842 = load i8, i8 addrspace(4)* %2841, align 1, !tbaa !21
  %2843 = zext i8 %2842 to i64
  %2844 = shl nuw nsw i64 %2843, 40
  %2845 = or i64 %2840, %2844
  %2846 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 6
  %2847 = load i8, i8 addrspace(4)* %2846, align 1, !tbaa !21
  %2848 = zext i8 %2847 to i64
  %2849 = shl nuw nsw i64 %2848, 48
  %2850 = or i64 %2845, %2849
  %2851 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 7
  %2852 = load i8, i8 addrspace(4)* %2851, align 1, !tbaa !21
  %2853 = zext i8 %2852 to i64
  %2854 = shl nuw i64 %2853, 56
  %2855 = or i64 %2850, %2854
  %2856 = add nsw i32 %2813, -8
  %2857 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 8
  br label %2871

2858:                                             ; preds = %2816, %2858
  %2859 = phi i32 [ %2869, %2858 ], [ 0, %2816 ]
  %2860 = phi i64 [ %2868, %2858 ], [ 0, %2816 ]
  %2861 = zext i32 %2859 to i64
  %2862 = getelementptr inbounds i8, i8 addrspace(4)* %2812, i64 %2861
  %2863 = load i8, i8 addrspace(4)* %2862, align 1, !tbaa !21
  %2864 = zext i8 %2863 to i64
  %2865 = shl i32 %2859, 3
  %2866 = zext i32 %2865 to i64
  %2867 = shl nuw i64 %2864, %2866
  %2868 = or i64 %2867, %2860
  %2869 = add nuw nsw i32 %2859, 1
  %2870 = icmp eq i32 %2869, %2813
  br i1 %2870, label %2871, label %2858

2871:                                             ; preds = %2858, %2818, %2816
  %2872 = phi i8 addrspace(4)* [ %2857, %2818 ], [ %2812, %2816 ], [ %2812, %2858 ]
  %2873 = phi i32 [ %2856, %2818 ], [ 0, %2816 ], [ 0, %2858 ]
  %2874 = phi i64 [ %2855, %2818 ], [ 0, %2816 ], [ %2868, %2858 ]
  %2875 = icmp ugt i32 %2873, 7
  br i1 %2875, label %2878, label %2876

2876:                                             ; preds = %2871
  %2877 = icmp eq i32 %2873, 0
  br i1 %2877, label %2931, label %2918

2878:                                             ; preds = %2871
  %2879 = load i8, i8 addrspace(4)* %2872, align 1, !tbaa !21
  %2880 = zext i8 %2879 to i64
  %2881 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 1
  %2882 = load i8, i8 addrspace(4)* %2881, align 1, !tbaa !21
  %2883 = zext i8 %2882 to i64
  %2884 = shl nuw nsw i64 %2883, 8
  %2885 = or i64 %2884, %2880
  %2886 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 2
  %2887 = load i8, i8 addrspace(4)* %2886, align 1, !tbaa !21
  %2888 = zext i8 %2887 to i64
  %2889 = shl nuw nsw i64 %2888, 16
  %2890 = or i64 %2885, %2889
  %2891 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 3
  %2892 = load i8, i8 addrspace(4)* %2891, align 1, !tbaa !21
  %2893 = zext i8 %2892 to i64
  %2894 = shl nuw nsw i64 %2893, 24
  %2895 = or i64 %2890, %2894
  %2896 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 4
  %2897 = load i8, i8 addrspace(4)* %2896, align 1, !tbaa !21
  %2898 = zext i8 %2897 to i64
  %2899 = shl nuw nsw i64 %2898, 32
  %2900 = or i64 %2895, %2899
  %2901 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 5
  %2902 = load i8, i8 addrspace(4)* %2901, align 1, !tbaa !21
  %2903 = zext i8 %2902 to i64
  %2904 = shl nuw nsw i64 %2903, 40
  %2905 = or i64 %2900, %2904
  %2906 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 6
  %2907 = load i8, i8 addrspace(4)* %2906, align 1, !tbaa !21
  %2908 = zext i8 %2907 to i64
  %2909 = shl nuw nsw i64 %2908, 48
  %2910 = or i64 %2905, %2909
  %2911 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 7
  %2912 = load i8, i8 addrspace(4)* %2911, align 1, !tbaa !21
  %2913 = zext i8 %2912 to i64
  %2914 = shl nuw i64 %2913, 56
  %2915 = or i64 %2910, %2914
  %2916 = add nsw i32 %2873, -8
  %2917 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 8
  br label %2931

2918:                                             ; preds = %2876, %2918
  %2919 = phi i32 [ %2929, %2918 ], [ 0, %2876 ]
  %2920 = phi i64 [ %2928, %2918 ], [ 0, %2876 ]
  %2921 = zext i32 %2919 to i64
  %2922 = getelementptr inbounds i8, i8 addrspace(4)* %2872, i64 %2921
  %2923 = load i8, i8 addrspace(4)* %2922, align 1, !tbaa !21
  %2924 = zext i8 %2923 to i64
  %2925 = shl i32 %2919, 3
  %2926 = zext i32 %2925 to i64
  %2927 = shl nuw i64 %2924, %2926
  %2928 = or i64 %2927, %2920
  %2929 = add nuw nsw i32 %2919, 1
  %2930 = icmp eq i32 %2929, %2873
  br i1 %2930, label %2931, label %2918

2931:                                             ; preds = %2918, %2878, %2876
  %2932 = phi i8 addrspace(4)* [ %2917, %2878 ], [ %2872, %2876 ], [ %2872, %2918 ]
  %2933 = phi i32 [ %2916, %2878 ], [ 0, %2876 ], [ 0, %2918 ]
  %2934 = phi i64 [ %2915, %2878 ], [ 0, %2876 ], [ %2928, %2918 ]
  %2935 = icmp ugt i32 %2933, 7
  br i1 %2935, label %2938, label %2936

2936:                                             ; preds = %2931
  %2937 = icmp eq i32 %2933, 0
  br i1 %2937, label %2991, label %2978

2938:                                             ; preds = %2931
  %2939 = load i8, i8 addrspace(4)* %2932, align 1, !tbaa !21
  %2940 = zext i8 %2939 to i64
  %2941 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 1
  %2942 = load i8, i8 addrspace(4)* %2941, align 1, !tbaa !21
  %2943 = zext i8 %2942 to i64
  %2944 = shl nuw nsw i64 %2943, 8
  %2945 = or i64 %2944, %2940
  %2946 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 2
  %2947 = load i8, i8 addrspace(4)* %2946, align 1, !tbaa !21
  %2948 = zext i8 %2947 to i64
  %2949 = shl nuw nsw i64 %2948, 16
  %2950 = or i64 %2945, %2949
  %2951 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 3
  %2952 = load i8, i8 addrspace(4)* %2951, align 1, !tbaa !21
  %2953 = zext i8 %2952 to i64
  %2954 = shl nuw nsw i64 %2953, 24
  %2955 = or i64 %2950, %2954
  %2956 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 4
  %2957 = load i8, i8 addrspace(4)* %2956, align 1, !tbaa !21
  %2958 = zext i8 %2957 to i64
  %2959 = shl nuw nsw i64 %2958, 32
  %2960 = or i64 %2955, %2959
  %2961 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 5
  %2962 = load i8, i8 addrspace(4)* %2961, align 1, !tbaa !21
  %2963 = zext i8 %2962 to i64
  %2964 = shl nuw nsw i64 %2963, 40
  %2965 = or i64 %2960, %2964
  %2966 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 6
  %2967 = load i8, i8 addrspace(4)* %2966, align 1, !tbaa !21
  %2968 = zext i8 %2967 to i64
  %2969 = shl nuw nsw i64 %2968, 48
  %2970 = or i64 %2965, %2969
  %2971 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 7
  %2972 = load i8, i8 addrspace(4)* %2971, align 1, !tbaa !21
  %2973 = zext i8 %2972 to i64
  %2974 = shl nuw i64 %2973, 56
  %2975 = or i64 %2970, %2974
  %2976 = add nsw i32 %2933, -8
  %2977 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 8
  br label %2991

2978:                                             ; preds = %2936, %2978
  %2979 = phi i32 [ %2989, %2978 ], [ 0, %2936 ]
  %2980 = phi i64 [ %2988, %2978 ], [ 0, %2936 ]
  %2981 = zext i32 %2979 to i64
  %2982 = getelementptr inbounds i8, i8 addrspace(4)* %2932, i64 %2981
  %2983 = load i8, i8 addrspace(4)* %2982, align 1, !tbaa !21
  %2984 = zext i8 %2983 to i64
  %2985 = shl i32 %2979, 3
  %2986 = zext i32 %2985 to i64
  %2987 = shl nuw i64 %2984, %2986
  %2988 = or i64 %2987, %2980
  %2989 = add nuw nsw i32 %2979, 1
  %2990 = icmp eq i32 %2989, %2933
  br i1 %2990, label %2991, label %2978

2991:                                             ; preds = %2978, %2938, %2936
  %2992 = phi i8 addrspace(4)* [ %2977, %2938 ], [ %2932, %2936 ], [ %2932, %2978 ]
  %2993 = phi i32 [ %2976, %2938 ], [ 0, %2936 ], [ 0, %2978 ]
  %2994 = phi i64 [ %2975, %2938 ], [ 0, %2936 ], [ %2988, %2978 ]
  %2995 = icmp ugt i32 %2993, 7
  br i1 %2995, label %2998, label %2996

2996:                                             ; preds = %2991
  %2997 = icmp eq i32 %2993, 0
  br i1 %2997, label %3051, label %3038

2998:                                             ; preds = %2991
  %2999 = load i8, i8 addrspace(4)* %2992, align 1, !tbaa !21
  %3000 = zext i8 %2999 to i64
  %3001 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 1
  %3002 = load i8, i8 addrspace(4)* %3001, align 1, !tbaa !21
  %3003 = zext i8 %3002 to i64
  %3004 = shl nuw nsw i64 %3003, 8
  %3005 = or i64 %3004, %3000
  %3006 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 2
  %3007 = load i8, i8 addrspace(4)* %3006, align 1, !tbaa !21
  %3008 = zext i8 %3007 to i64
  %3009 = shl nuw nsw i64 %3008, 16
  %3010 = or i64 %3005, %3009
  %3011 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 3
  %3012 = load i8, i8 addrspace(4)* %3011, align 1, !tbaa !21
  %3013 = zext i8 %3012 to i64
  %3014 = shl nuw nsw i64 %3013, 24
  %3015 = or i64 %3010, %3014
  %3016 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 4
  %3017 = load i8, i8 addrspace(4)* %3016, align 1, !tbaa !21
  %3018 = zext i8 %3017 to i64
  %3019 = shl nuw nsw i64 %3018, 32
  %3020 = or i64 %3015, %3019
  %3021 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 5
  %3022 = load i8, i8 addrspace(4)* %3021, align 1, !tbaa !21
  %3023 = zext i8 %3022 to i64
  %3024 = shl nuw nsw i64 %3023, 40
  %3025 = or i64 %3020, %3024
  %3026 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 6
  %3027 = load i8, i8 addrspace(4)* %3026, align 1, !tbaa !21
  %3028 = zext i8 %3027 to i64
  %3029 = shl nuw nsw i64 %3028, 48
  %3030 = or i64 %3025, %3029
  %3031 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 7
  %3032 = load i8, i8 addrspace(4)* %3031, align 1, !tbaa !21
  %3033 = zext i8 %3032 to i64
  %3034 = shl nuw i64 %3033, 56
  %3035 = or i64 %3030, %3034
  %3036 = add nsw i32 %2993, -8
  %3037 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 8
  br label %3051

3038:                                             ; preds = %2996, %3038
  %3039 = phi i32 [ %3049, %3038 ], [ 0, %2996 ]
  %3040 = phi i64 [ %3048, %3038 ], [ 0, %2996 ]
  %3041 = zext i32 %3039 to i64
  %3042 = getelementptr inbounds i8, i8 addrspace(4)* %2992, i64 %3041
  %3043 = load i8, i8 addrspace(4)* %3042, align 1, !tbaa !21
  %3044 = zext i8 %3043 to i64
  %3045 = shl i32 %3039, 3
  %3046 = zext i32 %3045 to i64
  %3047 = shl nuw i64 %3044, %3046
  %3048 = or i64 %3047, %3040
  %3049 = add nuw nsw i32 %3039, 1
  %3050 = icmp eq i32 %3049, %2993
  br i1 %3050, label %3051, label %3038

3051:                                             ; preds = %3038, %2998, %2996
  %3052 = phi i8 addrspace(4)* [ %3037, %2998 ], [ %2992, %2996 ], [ %2992, %3038 ]
  %3053 = phi i32 [ %3036, %2998 ], [ 0, %2996 ], [ 0, %3038 ]
  %3054 = phi i64 [ %3035, %2998 ], [ 0, %2996 ], [ %3048, %3038 ]
  %3055 = icmp ugt i32 %3053, 7
  br i1 %3055, label %3058, label %3056

3056:                                             ; preds = %3051
  %3057 = icmp eq i32 %3053, 0
  br i1 %3057, label %3111, label %3098

3058:                                             ; preds = %3051
  %3059 = load i8, i8 addrspace(4)* %3052, align 1, !tbaa !21
  %3060 = zext i8 %3059 to i64
  %3061 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 1
  %3062 = load i8, i8 addrspace(4)* %3061, align 1, !tbaa !21
  %3063 = zext i8 %3062 to i64
  %3064 = shl nuw nsw i64 %3063, 8
  %3065 = or i64 %3064, %3060
  %3066 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 2
  %3067 = load i8, i8 addrspace(4)* %3066, align 1, !tbaa !21
  %3068 = zext i8 %3067 to i64
  %3069 = shl nuw nsw i64 %3068, 16
  %3070 = or i64 %3065, %3069
  %3071 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 3
  %3072 = load i8, i8 addrspace(4)* %3071, align 1, !tbaa !21
  %3073 = zext i8 %3072 to i64
  %3074 = shl nuw nsw i64 %3073, 24
  %3075 = or i64 %3070, %3074
  %3076 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 4
  %3077 = load i8, i8 addrspace(4)* %3076, align 1, !tbaa !21
  %3078 = zext i8 %3077 to i64
  %3079 = shl nuw nsw i64 %3078, 32
  %3080 = or i64 %3075, %3079
  %3081 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 5
  %3082 = load i8, i8 addrspace(4)* %3081, align 1, !tbaa !21
  %3083 = zext i8 %3082 to i64
  %3084 = shl nuw nsw i64 %3083, 40
  %3085 = or i64 %3080, %3084
  %3086 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 6
  %3087 = load i8, i8 addrspace(4)* %3086, align 1, !tbaa !21
  %3088 = zext i8 %3087 to i64
  %3089 = shl nuw nsw i64 %3088, 48
  %3090 = or i64 %3085, %3089
  %3091 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 7
  %3092 = load i8, i8 addrspace(4)* %3091, align 1, !tbaa !21
  %3093 = zext i8 %3092 to i64
  %3094 = shl nuw i64 %3093, 56
  %3095 = or i64 %3090, %3094
  %3096 = add nsw i32 %3053, -8
  %3097 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 8
  br label %3111

3098:                                             ; preds = %3056, %3098
  %3099 = phi i32 [ %3109, %3098 ], [ 0, %3056 ]
  %3100 = phi i64 [ %3108, %3098 ], [ 0, %3056 ]
  %3101 = zext i32 %3099 to i64
  %3102 = getelementptr inbounds i8, i8 addrspace(4)* %3052, i64 %3101
  %3103 = load i8, i8 addrspace(4)* %3102, align 1, !tbaa !21
  %3104 = zext i8 %3103 to i64
  %3105 = shl i32 %3099, 3
  %3106 = zext i32 %3105 to i64
  %3107 = shl nuw i64 %3104, %3106
  %3108 = or i64 %3107, %3100
  %3109 = add nuw nsw i32 %3099, 1
  %3110 = icmp eq i32 %3109, %3053
  br i1 %3110, label %3111, label %3098

3111:                                             ; preds = %3098, %3058, %3056
  %3112 = phi i8 addrspace(4)* [ %3097, %3058 ], [ %3052, %3056 ], [ %3052, %3098 ]
  %3113 = phi i32 [ %3096, %3058 ], [ 0, %3056 ], [ 0, %3098 ]
  %3114 = phi i64 [ %3095, %3058 ], [ 0, %3056 ], [ %3108, %3098 ]
  %3115 = icmp ugt i32 %3113, 7
  br i1 %3115, label %3118, label %3116

3116:                                             ; preds = %3111
  %3117 = icmp eq i32 %3113, 0
  br i1 %3117, label %3169, label %3156

3118:                                             ; preds = %3111
  %3119 = load i8, i8 addrspace(4)* %3112, align 1, !tbaa !21
  %3120 = zext i8 %3119 to i64
  %3121 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 1
  %3122 = load i8, i8 addrspace(4)* %3121, align 1, !tbaa !21
  %3123 = zext i8 %3122 to i64
  %3124 = shl nuw nsw i64 %3123, 8
  %3125 = or i64 %3124, %3120
  %3126 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 2
  %3127 = load i8, i8 addrspace(4)* %3126, align 1, !tbaa !21
  %3128 = zext i8 %3127 to i64
  %3129 = shl nuw nsw i64 %3128, 16
  %3130 = or i64 %3125, %3129
  %3131 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 3
  %3132 = load i8, i8 addrspace(4)* %3131, align 1, !tbaa !21
  %3133 = zext i8 %3132 to i64
  %3134 = shl nuw nsw i64 %3133, 24
  %3135 = or i64 %3130, %3134
  %3136 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 4
  %3137 = load i8, i8 addrspace(4)* %3136, align 1, !tbaa !21
  %3138 = zext i8 %3137 to i64
  %3139 = shl nuw nsw i64 %3138, 32
  %3140 = or i64 %3135, %3139
  %3141 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 5
  %3142 = load i8, i8 addrspace(4)* %3141, align 1, !tbaa !21
  %3143 = zext i8 %3142 to i64
  %3144 = shl nuw nsw i64 %3143, 40
  %3145 = or i64 %3140, %3144
  %3146 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 6
  %3147 = load i8, i8 addrspace(4)* %3146, align 1, !tbaa !21
  %3148 = zext i8 %3147 to i64
  %3149 = shl nuw nsw i64 %3148, 48
  %3150 = or i64 %3145, %3149
  %3151 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 7
  %3152 = load i8, i8 addrspace(4)* %3151, align 1, !tbaa !21
  %3153 = zext i8 %3152 to i64
  %3154 = shl nuw i64 %3153, 56
  %3155 = or i64 %3150, %3154
  br label %3169

3156:                                             ; preds = %3116, %3156
  %3157 = phi i32 [ %3167, %3156 ], [ 0, %3116 ]
  %3158 = phi i64 [ %3166, %3156 ], [ 0, %3116 ]
  %3159 = zext i32 %3157 to i64
  %3160 = getelementptr inbounds i8, i8 addrspace(4)* %3112, i64 %3159
  %3161 = load i8, i8 addrspace(4)* %3160, align 1, !tbaa !21
  %3162 = zext i8 %3161 to i64
  %3163 = shl i32 %3157, 3
  %3164 = zext i32 %3163 to i64
  %3165 = shl nuw i64 %3162, %3164
  %3166 = or i64 %3165, %3158
  %3167 = add nuw nsw i32 %3157, 1
  %3168 = icmp eq i32 %3167, %3113
  br i1 %3168, label %3169, label %3156

3169:                                             ; preds = %3156, %3118, %3116
  %3170 = phi i64 [ %3155, %3118 ], [ 0, %3116 ], [ %3166, %3156 ]
  %3171 = shl nuw nsw i64 %2752, 2
  %3172 = add nuw nsw i64 %3171, 28
  %3173 = and i64 %3172, 480
  %3174 = and i64 %2754, -225
  %3175 = or i64 %3174, %3173
  %3176 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2732, i32 noundef 2, i64 noundef %3175, i64 noundef %2814, i64 noundef %2874, i64 noundef %2934, i64 noundef %2994, i64 noundef %3054, i64 noundef %3114, i64 noundef %3170) #12
  %3177 = sub i64 %2744, %2752
  %3178 = getelementptr inbounds i8, i8 addrspace(4)* %2745, i64 %2752
  %3179 = icmp eq i64 %3177, 0
  br i1 %3179, label %3180, label %2743

3180:                                             ; preds = %3169, %2735
  %3181 = phi <2 x i64> [ %2738, %2735 ], [ %3176, %3169 ]
  %3182 = extractelement <2 x i64> %3181, i64 0
  %3183 = icmp eq i8 addrspace(1)* %2546, addrspacecast (i8* null to i8 addrspace(1)*)
  br i1 %3183, label %3195, label %3184

3184:                                             ; preds = %3180, %3184
  %3185 = phi i8 addrspace(1)* [ %3186, %3184 ], [ %2546, %3180 ]
  %3186 = getelementptr i8, i8 addrspace(1)* %3185, i64 1
  %3187 = load i8, i8 addrspace(1)* %3185, align 1
  %3188 = icmp eq i8 %3187, 0
  br i1 %3188, label %3189, label %3184

3189:                                             ; preds = %3184
  %3190 = addrspacecast i8 addrspace(1)* %3185 to i8*
  %3191 = ptrtoint i8* %2547 to i64
  %3192 = ptrtoint i8* %3190 to i64
  %3193 = sub i64 %3192, %3191
  %3194 = add i64 %3193, 1
  br label %3195

3195:                                             ; preds = %3189, %3180
  %3196 = phi i64 [ %3194, %3189 ], [ 0, %3180 ]
  br i1 %3183, label %3197, label %3201

3197:                                             ; preds = %3195
  %3198 = and i64 %3182, -225
  %3199 = or i64 %3198, 32
  %3200 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2732, i32 noundef 2, i64 noundef %3199, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %3642

3201:                                             ; preds = %3195
  %3202 = and i64 %3182, 2
  %3203 = and i64 %3182, -3
  %3204 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %3203, i64 0
  br label %3205

3205:                                             ; preds = %3631, %3201
  %3206 = phi i64 [ %3196, %3201 ], [ %3639, %3631 ]
  %3207 = phi i8 addrspace(1)* [ %2546, %3201 ], [ %3640, %3631 ]
  %3208 = phi <2 x i64> [ %3204, %3201 ], [ %3638, %3631 ]
  %3209 = icmp ugt i64 %3206, 56
  %3210 = extractelement <2 x i64> %3208, i64 0
  %3211 = or i64 %3210, %3202
  %3212 = insertelement <2 x i64> poison, i64 %3211, i64 0
  %3213 = select i1 %3209, <2 x i64> %3208, <2 x i64> %3212
  %3214 = tail call i64 @llvm.umin.i64(i64 %3206, i64 56)
  %3215 = trunc i64 %3214 to i32
  %3216 = extractelement <2 x i64> %3213, i64 0
  %3217 = icmp ugt i32 %3215, 7
  br i1 %3217, label %3220, label %3218

3218:                                             ; preds = %3205
  %3219 = icmp eq i32 %3215, 0
  br i1 %3219, label %3273, label %3260

3220:                                             ; preds = %3205
  %3221 = load i8, i8 addrspace(1)* %3207, align 1, !tbaa !21
  %3222 = zext i8 %3221 to i64
  %3223 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 1
  %3224 = load i8, i8 addrspace(1)* %3223, align 1, !tbaa !21
  %3225 = zext i8 %3224 to i64
  %3226 = shl nuw nsw i64 %3225, 8
  %3227 = or i64 %3226, %3222
  %3228 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 2
  %3229 = load i8, i8 addrspace(1)* %3228, align 1, !tbaa !21
  %3230 = zext i8 %3229 to i64
  %3231 = shl nuw nsw i64 %3230, 16
  %3232 = or i64 %3227, %3231
  %3233 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 3
  %3234 = load i8, i8 addrspace(1)* %3233, align 1, !tbaa !21
  %3235 = zext i8 %3234 to i64
  %3236 = shl nuw nsw i64 %3235, 24
  %3237 = or i64 %3232, %3236
  %3238 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 4
  %3239 = load i8, i8 addrspace(1)* %3238, align 1, !tbaa !21
  %3240 = zext i8 %3239 to i64
  %3241 = shl nuw nsw i64 %3240, 32
  %3242 = or i64 %3237, %3241
  %3243 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 5
  %3244 = load i8, i8 addrspace(1)* %3243, align 1, !tbaa !21
  %3245 = zext i8 %3244 to i64
  %3246 = shl nuw nsw i64 %3245, 40
  %3247 = or i64 %3242, %3246
  %3248 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 6
  %3249 = load i8, i8 addrspace(1)* %3248, align 1, !tbaa !21
  %3250 = zext i8 %3249 to i64
  %3251 = shl nuw nsw i64 %3250, 48
  %3252 = or i64 %3247, %3251
  %3253 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 7
  %3254 = load i8, i8 addrspace(1)* %3253, align 1, !tbaa !21
  %3255 = zext i8 %3254 to i64
  %3256 = shl nuw i64 %3255, 56
  %3257 = or i64 %3252, %3256
  %3258 = add nsw i32 %3215, -8
  %3259 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 8
  br label %3273

3260:                                             ; preds = %3218, %3260
  %3261 = phi i32 [ %3271, %3260 ], [ 0, %3218 ]
  %3262 = phi i64 [ %3270, %3260 ], [ 0, %3218 ]
  %3263 = zext i32 %3261 to i64
  %3264 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 %3263
  %3265 = load i8, i8 addrspace(1)* %3264, align 1, !tbaa !21
  %3266 = zext i8 %3265 to i64
  %3267 = shl i32 %3261, 3
  %3268 = zext i32 %3267 to i64
  %3269 = shl nuw i64 %3266, %3268
  %3270 = or i64 %3269, %3262
  %3271 = add nuw nsw i32 %3261, 1
  %3272 = icmp eq i32 %3271, %3215
  br i1 %3272, label %3273, label %3260, !llvm.loop !22

3273:                                             ; preds = %3260, %3220, %3218
  %3274 = phi i8 addrspace(1)* [ %3259, %3220 ], [ %3207, %3218 ], [ %3207, %3260 ]
  %3275 = phi i32 [ %3258, %3220 ], [ 0, %3218 ], [ 0, %3260 ]
  %3276 = phi i64 [ %3257, %3220 ], [ 0, %3218 ], [ %3270, %3260 ]
  %3277 = icmp ugt i32 %3275, 7
  br i1 %3277, label %3280, label %3278

3278:                                             ; preds = %3273
  %3279 = icmp eq i32 %3275, 0
  br i1 %3279, label %3333, label %3320

3280:                                             ; preds = %3273
  %3281 = load i8, i8 addrspace(1)* %3274, align 1, !tbaa !21
  %3282 = zext i8 %3281 to i64
  %3283 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 1
  %3284 = load i8, i8 addrspace(1)* %3283, align 1, !tbaa !21
  %3285 = zext i8 %3284 to i64
  %3286 = shl nuw nsw i64 %3285, 8
  %3287 = or i64 %3286, %3282
  %3288 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 2
  %3289 = load i8, i8 addrspace(1)* %3288, align 1, !tbaa !21
  %3290 = zext i8 %3289 to i64
  %3291 = shl nuw nsw i64 %3290, 16
  %3292 = or i64 %3287, %3291
  %3293 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 3
  %3294 = load i8, i8 addrspace(1)* %3293, align 1, !tbaa !21
  %3295 = zext i8 %3294 to i64
  %3296 = shl nuw nsw i64 %3295, 24
  %3297 = or i64 %3292, %3296
  %3298 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 4
  %3299 = load i8, i8 addrspace(1)* %3298, align 1, !tbaa !21
  %3300 = zext i8 %3299 to i64
  %3301 = shl nuw nsw i64 %3300, 32
  %3302 = or i64 %3297, %3301
  %3303 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 5
  %3304 = load i8, i8 addrspace(1)* %3303, align 1, !tbaa !21
  %3305 = zext i8 %3304 to i64
  %3306 = shl nuw nsw i64 %3305, 40
  %3307 = or i64 %3302, %3306
  %3308 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 6
  %3309 = load i8, i8 addrspace(1)* %3308, align 1, !tbaa !21
  %3310 = zext i8 %3309 to i64
  %3311 = shl nuw nsw i64 %3310, 48
  %3312 = or i64 %3307, %3311
  %3313 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 7
  %3314 = load i8, i8 addrspace(1)* %3313, align 1, !tbaa !21
  %3315 = zext i8 %3314 to i64
  %3316 = shl nuw i64 %3315, 56
  %3317 = or i64 %3312, %3316
  %3318 = add nsw i32 %3275, -8
  %3319 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 8
  br label %3333

3320:                                             ; preds = %3278, %3320
  %3321 = phi i32 [ %3331, %3320 ], [ 0, %3278 ]
  %3322 = phi i64 [ %3330, %3320 ], [ 0, %3278 ]
  %3323 = zext i32 %3321 to i64
  %3324 = getelementptr inbounds i8, i8 addrspace(1)* %3274, i64 %3323
  %3325 = load i8, i8 addrspace(1)* %3324, align 1, !tbaa !21
  %3326 = zext i8 %3325 to i64
  %3327 = shl i32 %3321, 3
  %3328 = zext i32 %3327 to i64
  %3329 = shl nuw i64 %3326, %3328
  %3330 = or i64 %3329, %3322
  %3331 = add nuw nsw i32 %3321, 1
  %3332 = icmp eq i32 %3331, %3275
  br i1 %3332, label %3333, label %3320

3333:                                             ; preds = %3320, %3280, %3278
  %3334 = phi i8 addrspace(1)* [ %3319, %3280 ], [ %3274, %3278 ], [ %3274, %3320 ]
  %3335 = phi i32 [ %3318, %3280 ], [ 0, %3278 ], [ 0, %3320 ]
  %3336 = phi i64 [ %3317, %3280 ], [ 0, %3278 ], [ %3330, %3320 ]
  %3337 = icmp ugt i32 %3335, 7
  br i1 %3337, label %3340, label %3338

3338:                                             ; preds = %3333
  %3339 = icmp eq i32 %3335, 0
  br i1 %3339, label %3393, label %3380

3340:                                             ; preds = %3333
  %3341 = load i8, i8 addrspace(1)* %3334, align 1, !tbaa !21
  %3342 = zext i8 %3341 to i64
  %3343 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 1
  %3344 = load i8, i8 addrspace(1)* %3343, align 1, !tbaa !21
  %3345 = zext i8 %3344 to i64
  %3346 = shl nuw nsw i64 %3345, 8
  %3347 = or i64 %3346, %3342
  %3348 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 2
  %3349 = load i8, i8 addrspace(1)* %3348, align 1, !tbaa !21
  %3350 = zext i8 %3349 to i64
  %3351 = shl nuw nsw i64 %3350, 16
  %3352 = or i64 %3347, %3351
  %3353 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 3
  %3354 = load i8, i8 addrspace(1)* %3353, align 1, !tbaa !21
  %3355 = zext i8 %3354 to i64
  %3356 = shl nuw nsw i64 %3355, 24
  %3357 = or i64 %3352, %3356
  %3358 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 4
  %3359 = load i8, i8 addrspace(1)* %3358, align 1, !tbaa !21
  %3360 = zext i8 %3359 to i64
  %3361 = shl nuw nsw i64 %3360, 32
  %3362 = or i64 %3357, %3361
  %3363 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 5
  %3364 = load i8, i8 addrspace(1)* %3363, align 1, !tbaa !21
  %3365 = zext i8 %3364 to i64
  %3366 = shl nuw nsw i64 %3365, 40
  %3367 = or i64 %3362, %3366
  %3368 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 6
  %3369 = load i8, i8 addrspace(1)* %3368, align 1, !tbaa !21
  %3370 = zext i8 %3369 to i64
  %3371 = shl nuw nsw i64 %3370, 48
  %3372 = or i64 %3367, %3371
  %3373 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 7
  %3374 = load i8, i8 addrspace(1)* %3373, align 1, !tbaa !21
  %3375 = zext i8 %3374 to i64
  %3376 = shl nuw i64 %3375, 56
  %3377 = or i64 %3372, %3376
  %3378 = add nsw i32 %3335, -8
  %3379 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 8
  br label %3393

3380:                                             ; preds = %3338, %3380
  %3381 = phi i32 [ %3391, %3380 ], [ 0, %3338 ]
  %3382 = phi i64 [ %3390, %3380 ], [ 0, %3338 ]
  %3383 = zext i32 %3381 to i64
  %3384 = getelementptr inbounds i8, i8 addrspace(1)* %3334, i64 %3383
  %3385 = load i8, i8 addrspace(1)* %3384, align 1, !tbaa !21
  %3386 = zext i8 %3385 to i64
  %3387 = shl i32 %3381, 3
  %3388 = zext i32 %3387 to i64
  %3389 = shl nuw i64 %3386, %3388
  %3390 = or i64 %3389, %3382
  %3391 = add nuw nsw i32 %3381, 1
  %3392 = icmp eq i32 %3391, %3335
  br i1 %3392, label %3393, label %3380

3393:                                             ; preds = %3380, %3340, %3338
  %3394 = phi i8 addrspace(1)* [ %3379, %3340 ], [ %3334, %3338 ], [ %3334, %3380 ]
  %3395 = phi i32 [ %3378, %3340 ], [ 0, %3338 ], [ 0, %3380 ]
  %3396 = phi i64 [ %3377, %3340 ], [ 0, %3338 ], [ %3390, %3380 ]
  %3397 = icmp ugt i32 %3395, 7
  br i1 %3397, label %3400, label %3398

3398:                                             ; preds = %3393
  %3399 = icmp eq i32 %3395, 0
  br i1 %3399, label %3453, label %3440

3400:                                             ; preds = %3393
  %3401 = load i8, i8 addrspace(1)* %3394, align 1, !tbaa !21
  %3402 = zext i8 %3401 to i64
  %3403 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 1
  %3404 = load i8, i8 addrspace(1)* %3403, align 1, !tbaa !21
  %3405 = zext i8 %3404 to i64
  %3406 = shl nuw nsw i64 %3405, 8
  %3407 = or i64 %3406, %3402
  %3408 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 2
  %3409 = load i8, i8 addrspace(1)* %3408, align 1, !tbaa !21
  %3410 = zext i8 %3409 to i64
  %3411 = shl nuw nsw i64 %3410, 16
  %3412 = or i64 %3407, %3411
  %3413 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 3
  %3414 = load i8, i8 addrspace(1)* %3413, align 1, !tbaa !21
  %3415 = zext i8 %3414 to i64
  %3416 = shl nuw nsw i64 %3415, 24
  %3417 = or i64 %3412, %3416
  %3418 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 4
  %3419 = load i8, i8 addrspace(1)* %3418, align 1, !tbaa !21
  %3420 = zext i8 %3419 to i64
  %3421 = shl nuw nsw i64 %3420, 32
  %3422 = or i64 %3417, %3421
  %3423 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 5
  %3424 = load i8, i8 addrspace(1)* %3423, align 1, !tbaa !21
  %3425 = zext i8 %3424 to i64
  %3426 = shl nuw nsw i64 %3425, 40
  %3427 = or i64 %3422, %3426
  %3428 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 6
  %3429 = load i8, i8 addrspace(1)* %3428, align 1, !tbaa !21
  %3430 = zext i8 %3429 to i64
  %3431 = shl nuw nsw i64 %3430, 48
  %3432 = or i64 %3427, %3431
  %3433 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 7
  %3434 = load i8, i8 addrspace(1)* %3433, align 1, !tbaa !21
  %3435 = zext i8 %3434 to i64
  %3436 = shl nuw i64 %3435, 56
  %3437 = or i64 %3432, %3436
  %3438 = add nsw i32 %3395, -8
  %3439 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 8
  br label %3453

3440:                                             ; preds = %3398, %3440
  %3441 = phi i32 [ %3451, %3440 ], [ 0, %3398 ]
  %3442 = phi i64 [ %3450, %3440 ], [ 0, %3398 ]
  %3443 = zext i32 %3441 to i64
  %3444 = getelementptr inbounds i8, i8 addrspace(1)* %3394, i64 %3443
  %3445 = load i8, i8 addrspace(1)* %3444, align 1, !tbaa !21
  %3446 = zext i8 %3445 to i64
  %3447 = shl i32 %3441, 3
  %3448 = zext i32 %3447 to i64
  %3449 = shl nuw i64 %3446, %3448
  %3450 = or i64 %3449, %3442
  %3451 = add nuw nsw i32 %3441, 1
  %3452 = icmp eq i32 %3451, %3395
  br i1 %3452, label %3453, label %3440

3453:                                             ; preds = %3440, %3400, %3398
  %3454 = phi i8 addrspace(1)* [ %3439, %3400 ], [ %3394, %3398 ], [ %3394, %3440 ]
  %3455 = phi i32 [ %3438, %3400 ], [ 0, %3398 ], [ 0, %3440 ]
  %3456 = phi i64 [ %3437, %3400 ], [ 0, %3398 ], [ %3450, %3440 ]
  %3457 = icmp ugt i32 %3455, 7
  br i1 %3457, label %3460, label %3458

3458:                                             ; preds = %3453
  %3459 = icmp eq i32 %3455, 0
  br i1 %3459, label %3513, label %3500

3460:                                             ; preds = %3453
  %3461 = load i8, i8 addrspace(1)* %3454, align 1, !tbaa !21
  %3462 = zext i8 %3461 to i64
  %3463 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 1
  %3464 = load i8, i8 addrspace(1)* %3463, align 1, !tbaa !21
  %3465 = zext i8 %3464 to i64
  %3466 = shl nuw nsw i64 %3465, 8
  %3467 = or i64 %3466, %3462
  %3468 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 2
  %3469 = load i8, i8 addrspace(1)* %3468, align 1, !tbaa !21
  %3470 = zext i8 %3469 to i64
  %3471 = shl nuw nsw i64 %3470, 16
  %3472 = or i64 %3467, %3471
  %3473 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 3
  %3474 = load i8, i8 addrspace(1)* %3473, align 1, !tbaa !21
  %3475 = zext i8 %3474 to i64
  %3476 = shl nuw nsw i64 %3475, 24
  %3477 = or i64 %3472, %3476
  %3478 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 4
  %3479 = load i8, i8 addrspace(1)* %3478, align 1, !tbaa !21
  %3480 = zext i8 %3479 to i64
  %3481 = shl nuw nsw i64 %3480, 32
  %3482 = or i64 %3477, %3481
  %3483 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 5
  %3484 = load i8, i8 addrspace(1)* %3483, align 1, !tbaa !21
  %3485 = zext i8 %3484 to i64
  %3486 = shl nuw nsw i64 %3485, 40
  %3487 = or i64 %3482, %3486
  %3488 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 6
  %3489 = load i8, i8 addrspace(1)* %3488, align 1, !tbaa !21
  %3490 = zext i8 %3489 to i64
  %3491 = shl nuw nsw i64 %3490, 48
  %3492 = or i64 %3487, %3491
  %3493 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 7
  %3494 = load i8, i8 addrspace(1)* %3493, align 1, !tbaa !21
  %3495 = zext i8 %3494 to i64
  %3496 = shl nuw i64 %3495, 56
  %3497 = or i64 %3492, %3496
  %3498 = add nsw i32 %3455, -8
  %3499 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 8
  br label %3513

3500:                                             ; preds = %3458, %3500
  %3501 = phi i32 [ %3511, %3500 ], [ 0, %3458 ]
  %3502 = phi i64 [ %3510, %3500 ], [ 0, %3458 ]
  %3503 = zext i32 %3501 to i64
  %3504 = getelementptr inbounds i8, i8 addrspace(1)* %3454, i64 %3503
  %3505 = load i8, i8 addrspace(1)* %3504, align 1, !tbaa !21
  %3506 = zext i8 %3505 to i64
  %3507 = shl i32 %3501, 3
  %3508 = zext i32 %3507 to i64
  %3509 = shl nuw i64 %3506, %3508
  %3510 = or i64 %3509, %3502
  %3511 = add nuw nsw i32 %3501, 1
  %3512 = icmp eq i32 %3511, %3455
  br i1 %3512, label %3513, label %3500

3513:                                             ; preds = %3500, %3460, %3458
  %3514 = phi i8 addrspace(1)* [ %3499, %3460 ], [ %3454, %3458 ], [ %3454, %3500 ]
  %3515 = phi i32 [ %3498, %3460 ], [ 0, %3458 ], [ 0, %3500 ]
  %3516 = phi i64 [ %3497, %3460 ], [ 0, %3458 ], [ %3510, %3500 ]
  %3517 = icmp ugt i32 %3515, 7
  br i1 %3517, label %3520, label %3518

3518:                                             ; preds = %3513
  %3519 = icmp eq i32 %3515, 0
  br i1 %3519, label %3573, label %3560

3520:                                             ; preds = %3513
  %3521 = load i8, i8 addrspace(1)* %3514, align 1, !tbaa !21
  %3522 = zext i8 %3521 to i64
  %3523 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 1
  %3524 = load i8, i8 addrspace(1)* %3523, align 1, !tbaa !21
  %3525 = zext i8 %3524 to i64
  %3526 = shl nuw nsw i64 %3525, 8
  %3527 = or i64 %3526, %3522
  %3528 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 2
  %3529 = load i8, i8 addrspace(1)* %3528, align 1, !tbaa !21
  %3530 = zext i8 %3529 to i64
  %3531 = shl nuw nsw i64 %3530, 16
  %3532 = or i64 %3527, %3531
  %3533 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 3
  %3534 = load i8, i8 addrspace(1)* %3533, align 1, !tbaa !21
  %3535 = zext i8 %3534 to i64
  %3536 = shl nuw nsw i64 %3535, 24
  %3537 = or i64 %3532, %3536
  %3538 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 4
  %3539 = load i8, i8 addrspace(1)* %3538, align 1, !tbaa !21
  %3540 = zext i8 %3539 to i64
  %3541 = shl nuw nsw i64 %3540, 32
  %3542 = or i64 %3537, %3541
  %3543 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 5
  %3544 = load i8, i8 addrspace(1)* %3543, align 1, !tbaa !21
  %3545 = zext i8 %3544 to i64
  %3546 = shl nuw nsw i64 %3545, 40
  %3547 = or i64 %3542, %3546
  %3548 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 6
  %3549 = load i8, i8 addrspace(1)* %3548, align 1, !tbaa !21
  %3550 = zext i8 %3549 to i64
  %3551 = shl nuw nsw i64 %3550, 48
  %3552 = or i64 %3547, %3551
  %3553 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 7
  %3554 = load i8, i8 addrspace(1)* %3553, align 1, !tbaa !21
  %3555 = zext i8 %3554 to i64
  %3556 = shl nuw i64 %3555, 56
  %3557 = or i64 %3552, %3556
  %3558 = add nsw i32 %3515, -8
  %3559 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 8
  br label %3573

3560:                                             ; preds = %3518, %3560
  %3561 = phi i32 [ %3571, %3560 ], [ 0, %3518 ]
  %3562 = phi i64 [ %3570, %3560 ], [ 0, %3518 ]
  %3563 = zext i32 %3561 to i64
  %3564 = getelementptr inbounds i8, i8 addrspace(1)* %3514, i64 %3563
  %3565 = load i8, i8 addrspace(1)* %3564, align 1, !tbaa !21
  %3566 = zext i8 %3565 to i64
  %3567 = shl i32 %3561, 3
  %3568 = zext i32 %3567 to i64
  %3569 = shl nuw i64 %3566, %3568
  %3570 = or i64 %3569, %3562
  %3571 = add nuw nsw i32 %3561, 1
  %3572 = icmp eq i32 %3571, %3515
  br i1 %3572, label %3573, label %3560

3573:                                             ; preds = %3560, %3520, %3518
  %3574 = phi i8 addrspace(1)* [ %3559, %3520 ], [ %3514, %3518 ], [ %3514, %3560 ]
  %3575 = phi i32 [ %3558, %3520 ], [ 0, %3518 ], [ 0, %3560 ]
  %3576 = phi i64 [ %3557, %3520 ], [ 0, %3518 ], [ %3570, %3560 ]
  %3577 = icmp ugt i32 %3575, 7
  br i1 %3577, label %3580, label %3578

3578:                                             ; preds = %3573
  %3579 = icmp eq i32 %3575, 0
  br i1 %3579, label %3631, label %3618

3580:                                             ; preds = %3573
  %3581 = load i8, i8 addrspace(1)* %3574, align 1, !tbaa !21
  %3582 = zext i8 %3581 to i64
  %3583 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 1
  %3584 = load i8, i8 addrspace(1)* %3583, align 1, !tbaa !21
  %3585 = zext i8 %3584 to i64
  %3586 = shl nuw nsw i64 %3585, 8
  %3587 = or i64 %3586, %3582
  %3588 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 2
  %3589 = load i8, i8 addrspace(1)* %3588, align 1, !tbaa !21
  %3590 = zext i8 %3589 to i64
  %3591 = shl nuw nsw i64 %3590, 16
  %3592 = or i64 %3587, %3591
  %3593 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 3
  %3594 = load i8, i8 addrspace(1)* %3593, align 1, !tbaa !21
  %3595 = zext i8 %3594 to i64
  %3596 = shl nuw nsw i64 %3595, 24
  %3597 = or i64 %3592, %3596
  %3598 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 4
  %3599 = load i8, i8 addrspace(1)* %3598, align 1, !tbaa !21
  %3600 = zext i8 %3599 to i64
  %3601 = shl nuw nsw i64 %3600, 32
  %3602 = or i64 %3597, %3601
  %3603 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 5
  %3604 = load i8, i8 addrspace(1)* %3603, align 1, !tbaa !21
  %3605 = zext i8 %3604 to i64
  %3606 = shl nuw nsw i64 %3605, 40
  %3607 = or i64 %3602, %3606
  %3608 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 6
  %3609 = load i8, i8 addrspace(1)* %3608, align 1, !tbaa !21
  %3610 = zext i8 %3609 to i64
  %3611 = shl nuw nsw i64 %3610, 48
  %3612 = or i64 %3607, %3611
  %3613 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 7
  %3614 = load i8, i8 addrspace(1)* %3613, align 1, !tbaa !21
  %3615 = zext i8 %3614 to i64
  %3616 = shl nuw i64 %3615, 56
  %3617 = or i64 %3612, %3616
  br label %3631

3618:                                             ; preds = %3578, %3618
  %3619 = phi i32 [ %3629, %3618 ], [ 0, %3578 ]
  %3620 = phi i64 [ %3628, %3618 ], [ 0, %3578 ]
  %3621 = zext i32 %3619 to i64
  %3622 = getelementptr inbounds i8, i8 addrspace(1)* %3574, i64 %3621
  %3623 = load i8, i8 addrspace(1)* %3622, align 1, !tbaa !21
  %3624 = zext i8 %3623 to i64
  %3625 = shl i32 %3619, 3
  %3626 = zext i32 %3625 to i64
  %3627 = shl nuw i64 %3624, %3626
  %3628 = or i64 %3627, %3620
  %3629 = add nuw nsw i32 %3619, 1
  %3630 = icmp eq i32 %3629, %3575
  br i1 %3630, label %3631, label %3618

3631:                                             ; preds = %3618, %3580, %3578
  %3632 = phi i64 [ %3617, %3580 ], [ 0, %3578 ], [ %3628, %3618 ]
  %3633 = shl nuw nsw i64 %3214, 2
  %3634 = add nuw nsw i64 %3633, 28
  %3635 = and i64 %3634, 480
  %3636 = and i64 %3216, -225
  %3637 = or i64 %3636, %3635
  %3638 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2732, i32 noundef 2, i64 noundef %3637, i64 noundef %3276, i64 noundef %3336, i64 noundef %3396, i64 noundef %3456, i64 noundef %3516, i64 noundef %3576, i64 noundef %3632) #12
  %3639 = sub i64 %3206, %3214
  %3640 = getelementptr inbounds i8, i8 addrspace(1)* %3207, i64 %3214
  %3641 = icmp eq i64 %3639, 0
  br i1 %3641, label %3642, label %3205

3642:                                             ; preds = %3631, %3197
  %3643 = phi <2 x i64> [ %3200, %3197 ], [ %3638, %3631 ]
  %3644 = extractelement <2 x i64> %3643, i64 0
  %3645 = zext i32 %0 to i64
  %3646 = and i64 %3644, -227
  %3647 = or i64 %3646, 34
  %3648 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2732, i32 noundef 2, i64 noundef %3647, i64 noundef %3645, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %3649

3649:                                             ; preds = %3642, %2657
  tail call fastcc void @__ockl_dm_dealloc(i64 %2548) #12
  br label %3650

3650:                                             ; preds = %3649, %2538
  %3651 = ptrtoint i8* %122 to i64
  tail call fastcc void @__ockl_dm_dealloc(i64 %3651) #12
  ret void
}

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc void @__ockl_dm_dealloc(i64 noundef %0) unnamed_addr #2 {
  %2 = and i64 %0, 4095
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %21

4:                                                ; preds = %1
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !17
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i32 noundef 3, i64 noundef %0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %12 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %13 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %14 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %13, i32 0)
  %15 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %12, i32 %14)
  %16 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %17 = icmp eq i32 %15, 0
  br i1 %17, label %18, label %106

18:                                               ; preds = %4
  %19 = tail call i64 @llvm.ctpop.i64(i64 %16), !range !31
  %20 = atomicrmw sub i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %19 syncscope("agent-one-as") monotonic, align 8
  br label %106

21:                                               ; preds = %1
  %22 = and i64 %0, -2097152
  %23 = inttoptr i64 %22 to %5 addrspace(1)*
  %24 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 0
  %25 = load i32, i32 addrspace(1)* %24, align 2097152, !tbaa !32
  %26 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 1
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !35
  %28 = zext i32 %25 to i64
  %29 = icmp ult i32 %27, 256
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %28, i64 %30
  %32 = add i32 %27, -256
  %33 = lshr i32 %32, 8
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %28, i64 %34, i32 0
  %36 = and i32 %27, 255
  %37 = zext i32 %36 to i64
  %38 = trunc i64 %0 to i32
  %39 = and i32 %38, 2097151
  %40 = lshr i32 %25, 1
  %41 = add nuw i32 %40, 4
  %42 = and i32 %41, 31
  %43 = shl nuw i32 1, %42
  %44 = and i32 %25, 1
  %45 = icmp eq i32 %44, 0
  %46 = lshr i32 %43, 1
  %47 = select i1 %45, i32 0, i32 %46
  %48 = add nuw i32 %47, %43
  %49 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %28, i32 3
  br label %50

50:                                               ; preds = %101, %21
  %51 = phi i32 [ 1, %21 ], [ %102, %101 ]
  %52 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %51) #12, !srcloc !36
  %53 = icmp eq i32 %51, 0
  br i1 %53, label %101, label %54

54:                                               ; preds = %50
  %55 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %25)
  %56 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %27)
  %57 = icmp eq i32 %25, %55
  %58 = icmp eq i32 %27, %56
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %101

60:                                               ; preds = %54
  %61 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %62 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %63 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %62, i32 0)
  %64 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %61, i32 %63)
  %65 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %66 = tail call i64 @llvm.ctpop.i64(i64 %65), !range !31
  %67 = trunc i64 %66 to i32
  %68 = icmp ne i32 %64, 0
  %69 = select i1 %68, i1 true, i1 %29
  %70 = select i1 %68, %3 addrspace(1)* null, %3 addrspace(1)* %31
  br i1 %69, label %75, label %71

71:                                               ; preds = %60
  %72 = load atomic i64, i64 addrspace(1)* %35 syncscope("agent-one-as") monotonic, align 8
  %73 = inttoptr i64 %72 to %3 addrspace(1)*
  %74 = getelementptr inbounds %3, %3 addrspace(1)* %73, i64 %37
  br label %75

75:                                               ; preds = %71, %60
  %76 = phi %3 addrspace(1)* [ %74, %71 ], [ %70, %60 ]
  %77 = ptrtoint %3 addrspace(1)* %76 to i64
  %78 = trunc i64 %77 to i32
  %79 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %78)
  %80 = lshr i64 %77, 32
  %81 = trunc i64 %80 to i32
  %82 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %81)
  %83 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !37
  %84 = sub i32 %39, %83
  %85 = udiv i32 %84, %48
  %86 = and i32 %85, 31
  %87 = shl nuw i32 1, %86
  %88 = xor i32 %87, -1
  %89 = lshr i32 %85, 5
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 4, i64 %90
  %92 = atomicrmw and i32 addrspace(1)* %91, i32 %88 syncscope("agent-one-as") monotonic, align 4
  br i1 %68, label %101, label %93

93:                                               ; preds = %75
  %94 = insertelement <2 x i32> undef, i32 %79, i64 0
  %95 = insertelement <2 x i32> %94, i32 %82, i64 1
  %96 = bitcast <2 x i32> %95 to i64
  %97 = inttoptr i64 %96 to i8 addrspace(1)*
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %97, i64 16
  %99 = bitcast i8 addrspace(1)* %98 to i32 addrspace(1)*
  %100 = atomicrmw sub i32 addrspace(1)* %99, i32 %67 syncscope("agent-one-as") monotonic, align 4
  br label %101

101:                                              ; preds = %93, %75, %54, %50
  %102 = phi i32 [ 0, %50 ], [ 1, %54 ], [ 0, %93 ], [ 0, %75 ]
  %103 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %102) #12, !srcloc !39
  %104 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %103, i32 noundef 0, i32 noundef 33) #14
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %106, label %50

106:                                              ; preds = %101, %18, %4
  ret void
}

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #4

; Function Attrs: nofree nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i32(i32, i32, i32 immarg) #6

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #7

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) unnamed_addr #8 {
  %11 = alloca i8*, align 8, addrspace(5)
  %12 = alloca i32, align 4, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i64, align 8, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca i32, align 4, addrspace(5)
  %23 = alloca %6 addrspace(1)*, align 8, addrspace(5)
  %24 = alloca i64, align 8, addrspace(5)
  %25 = alloca %7 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca %8 addrspace(1)*, align 8, addrspace(5)
  %27 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %11, align 8, !tbaa !40
  store i32 %1, i32 addrspace(5)* %12, align 4, !tbaa !42
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !17
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !17
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !17
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !17
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !17
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !17
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !17
  store i64 %9, i64 addrspace(5)* %20, align 8, !tbaa !17
  %28 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %28) #10
  %29 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %30 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %29)
  store i32 %30, i32 addrspace(5)* %21, align 4, !tbaa !42
  %31 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %32 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %31) #12, !srcloc !43
  store i32 %32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %33 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %33) #10
  %34 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %35 = call i32 @llvm.amdgcn.readfirstlane(i32 %34)
  store i32 %35, i32 addrspace(5)* %22, align 4, !tbaa !42
  %36 = bitcast %6 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %36) #10
  %37 = load i8*, i8* addrspace(5)* %11, align 8, !tbaa !40
  %38 = addrspacecast i8* %37 to %6 addrspace(1)*
  store %6 addrspace(1)* %38, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !40
  %39 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %39) #10
  %40 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !40
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %42 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !42
  %43 = icmp eq i32 %41, %42
  br i1 %43, label %44, label %69

44:                                               ; preds = %10
  %45 = getelementptr inbounds %6, %6 addrspace(1)* %40, i64 0, i32 3
  %46 = load atomic i64, i64 addrspace(1)* %45 syncscope("one-as") acquire, align 8
  %47 = getelementptr %6, %6 addrspace(1)* %40, i64 0, i32 0
  %48 = getelementptr %6, %6 addrspace(1)* %40, i64 0, i32 5
  %49 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %47, align 8, !tbaa !44
  %50 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !47
  %51 = and i64 %50, %46
  %52 = getelementptr inbounds %7, %7 addrspace(1)* %49, i64 %51, i32 0
  %53 = load atomic i64, i64 addrspace(1)* %52 syncscope("one-as") monotonic, align 8
  %54 = cmpxchg i64 addrspace(1)* %45, i64 %46, i64 %53 syncscope("one-as") acquire monotonic, align 8
  %55 = extractvalue { i64, i1 } %54, 1
  br i1 %55, label %66, label %56

56:                                               ; preds = %56, %44
  %57 = phi { i64, i1 } [ %64, %56 ], [ %54, %44 ]
  %58 = extractvalue { i64, i1 } %57, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %59 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %47, align 8, !tbaa !44
  %60 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !47
  %61 = and i64 %60, %58
  %62 = getelementptr inbounds %7, %7 addrspace(1)* %59, i64 %61, i32 0
  %63 = load atomic i64, i64 addrspace(1)* %62 syncscope("one-as") monotonic, align 8
  %64 = cmpxchg i64 addrspace(1)* %45, i64 %58, i64 %63 syncscope("one-as") acquire monotonic, align 8
  %65 = extractvalue { i64, i1 } %64, 1
  br i1 %65, label %66, label %56

66:                                               ; preds = %56, %44
  %67 = phi { i64, i1 } [ %54, %44 ], [ %64, %56 ]
  %68 = extractvalue { i64, i1 } %67, 0
  br label %69

69:                                               ; preds = %10, %66
  %70 = phi i64 [ %68, %66 ], [ 0, %10 ]
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = trunc i64 %72 to i32
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %71)
  %75 = call i32 @llvm.amdgcn.readfirstlane(i32 %73)
  %76 = zext i32 %75 to i64
  %77 = shl nuw i64 %76, 32
  %78 = zext i32 %74 to i64
  %79 = or i64 %77, %78
  store i64 %79, i64 addrspace(5)* %24, align 8, !tbaa !17
  %80 = bitcast %7 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %80) #10
  %81 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !40
  %82 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !17
  %83 = getelementptr %6, %6 addrspace(1)* %81, i64 0, i32 0
  %84 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %83, align 8, !tbaa !44
  %85 = getelementptr %6, %6 addrspace(1)* %81, i64 0, i32 5
  %86 = load i64, i64 addrspace(1)* %85, align 8, !tbaa !47
  %87 = and i64 %82, %86
  %88 = getelementptr inbounds %7, %7 addrspace(1)* %84, i64 %87
  store %7 addrspace(1)* %88, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !40
  %89 = bitcast %8 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %89) #10
  %90 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !40
  %91 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !17
  %92 = getelementptr %6, %6 addrspace(1)* %90, i64 0, i32 1
  %93 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(1)* %92, align 8, !tbaa !48
  %94 = getelementptr %6, %6 addrspace(1)* %90, i64 0, i32 5
  %95 = load i64, i64 addrspace(1)* %94, align 8, !tbaa !47
  %96 = and i64 %91, %95
  %97 = getelementptr inbounds %8, %8 addrspace(1)* %93, i64 %96
  store %8 addrspace(1)* %97, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !40
  %98 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !40
  %99 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !40
  %100 = load i32, i32 addrspace(5)* %12, align 4, !tbaa !42
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !17
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !17
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !17
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !17
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !17
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !17
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !17
  %108 = load i64, i64 addrspace(5)* %20, align 8, !tbaa !17
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %110 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !42
  %111 = call i64 @llvm.read_register.i64(metadata !30) #13
  %112 = icmp eq i32 %109, %110
  br i1 %112, label %113, label %117

113:                                              ; preds = %69
  %114 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 2
  store i32 %100, i32 addrspace(1)* %114, align 8, !tbaa !49
  %115 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 1
  store i64 %111, i64 addrspace(1)* %115, align 8, !tbaa !51
  %116 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %116, align 4, !tbaa !52
  br label %117

117:                                              ; preds = %69, %113
  %118 = zext i32 %109 to i64
  %119 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 0
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !17
  %120 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 1
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !17
  %121 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 2
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !17
  %122 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 3
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !17
  %123 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 4
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !17
  %124 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 5
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !17
  %125 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 6
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !17
  %126 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 7
  store i64 %108, i64 addrspace(1)* %126, align 8, !tbaa !17
  %127 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !40
  %128 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !17
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %130 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !42
  %131 = icmp eq i32 %129, %130
  br i1 %131, label %132, label %164

132:                                              ; preds = %117
  %133 = getelementptr inbounds %6, %6 addrspace(1)* %127, i64 0, i32 4
  %134 = load atomic i64, i64 addrspace(1)* %133 syncscope("one-as") monotonic, align 8
  %135 = getelementptr %6, %6 addrspace(1)* %127, i64 0, i32 0
  %136 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %135, align 8, !tbaa !44
  %137 = getelementptr %6, %6 addrspace(1)* %127, i64 0, i32 5
  %138 = load i64, i64 addrspace(1)* %137, align 8, !tbaa !47
  %139 = and i64 %138, %128
  %140 = getelementptr inbounds %7, %7 addrspace(1)* %136, i64 %139, i32 0
  store i64 %134, i64 addrspace(1)* %140, align 8, !tbaa !53
  %141 = cmpxchg i64 addrspace(1)* %133, i64 %134, i64 %128 syncscope("one-as") release monotonic, align 8
  %142 = extractvalue { i64, i1 } %141, 1
  br i1 %142, label %148, label %143

143:                                              ; preds = %143, %132
  %144 = phi { i64, i1 } [ %146, %143 ], [ %141, %132 ]
  %145 = extractvalue { i64, i1 } %144, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %145, i64 addrspace(1)* %140, align 8, !tbaa !53
  %146 = cmpxchg i64 addrspace(1)* %133, i64 %145, i64 %128 syncscope("one-as") release monotonic, align 8
  %147 = extractvalue { i64, i1 } %146, 1
  br i1 %147, label %148, label %143

148:                                              ; preds = %143, %132
  %149 = getelementptr inbounds %6, %6 addrspace(1)* %127, i64 0, i32 2, i32 0
  %150 = load i64, i64 addrspace(1)* %149, align 8
  %151 = inttoptr i64 %150 to %10 addrspace(1)*
  %152 = getelementptr inbounds %10, %10 addrspace(1)* %151, i64 0, i32 1, i32 0
  %153 = atomicrmw add i64 addrspace(1)* %152, i64 1 syncscope("one-as") release, align 8
  %154 = getelementptr inbounds %10, %10 addrspace(1)* %151, i64 0, i32 2
  %155 = load i64, i64 addrspace(1)* %154, align 16, !tbaa !54
  %156 = icmp eq i64 %155, 0
  br i1 %156, label %164, label %157

157:                                              ; preds = %148
  %158 = inttoptr i64 %155 to i64 addrspace(1)*
  %159 = getelementptr inbounds %10, %10 addrspace(1)* %151, i64 0, i32 3
  %160 = load i32, i32 addrspace(1)* %159, align 8, !tbaa !56
  %161 = zext i32 %160 to i64
  store atomic i64 %161, i64 addrspace(1)* %158 syncscope("one-as") release, align 8
  %162 = call i32 @llvm.amdgcn.readfirstlane(i32 %160)
  %163 = and i32 %162, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %163)
  br label %164

164:                                              ; preds = %117, %148, %157
  %165 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %165) #10
  %166 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !40
  %167 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !40
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %169 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !42
  %170 = icmp eq i32 %168, %169
  %171 = getelementptr inbounds %7, %7 addrspace(1)* %166, i64 0, i32 3
  br label %172

172:                                              ; preds = %180, %164
  br i1 %170, label %173, label %176

173:                                              ; preds = %172
  %174 = load atomic i32, i32 addrspace(1)* %171 syncscope("one-as") acquire, align 4
  %175 = and i32 %174, 1
  br label %176

176:                                              ; preds = %173, %172
  %177 = phi i32 [ %175, %173 ], [ 1, %172 ]
  %178 = call i32 @llvm.amdgcn.readfirstlane(i32 %177)
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %181, label %180

180:                                              ; preds = %176
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %172

181:                                              ; preds = %176
  %182 = zext i32 %168 to i64
  %183 = getelementptr inbounds %8, %8 addrspace(1)* %167, i64 0, i32 0, i64 %182, i64 0
  %184 = getelementptr inbounds %8, %8 addrspace(1)* %167, i64 0, i32 0, i64 %182, i64 1
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !17
  %186 = load i64, i64 addrspace(1)* %184, align 8, !tbaa !17
  %187 = insertelement <2 x i64> undef, i64 %185, i64 0
  %188 = insertelement <2 x i64> %187, i64 %186, i64 1
  store <2 x i64> %188, <2 x i64> addrspace(5)* %27, align 16, !tbaa !21
  %189 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !40
  %190 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !17
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !42
  %192 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !42
  %193 = icmp eq i32 %191, %192
  br i1 %193, label %194, label %214

194:                                              ; preds = %181
  %195 = getelementptr inbounds %6, %6 addrspace(1)* %189, i64 0, i32 5
  %196 = load i64, i64 addrspace(1)* %195, align 8, !tbaa !47
  %197 = add i64 %196, 1
  %198 = add i64 %197, %190
  %199 = icmp eq i64 %198, 0
  %200 = select i1 %199, i64 %197, i64 %198
  %201 = getelementptr inbounds %6, %6 addrspace(1)* %189, i64 0, i32 3
  %202 = load atomic i64, i64 addrspace(1)* %201 syncscope("one-as") monotonic, align 8
  %203 = getelementptr %6, %6 addrspace(1)* %189, i64 0, i32 0
  %204 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %203, align 8, !tbaa !44
  %205 = and i64 %200, %196
  %206 = getelementptr inbounds %7, %7 addrspace(1)* %204, i64 %205, i32 0
  store i64 %202, i64 addrspace(1)* %206, align 8, !tbaa !53
  %207 = cmpxchg i64 addrspace(1)* %201, i64 %202, i64 %200 syncscope("one-as") release monotonic, align 8
  %208 = extractvalue { i64, i1 } %207, 1
  br i1 %208, label %214, label %209

209:                                              ; preds = %209, %194
  %210 = phi { i64, i1 } [ %212, %209 ], [ %207, %194 ]
  %211 = extractvalue { i64, i1 } %210, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %211, i64 addrspace(1)* %206, align 8, !tbaa !53
  %212 = cmpxchg i64 addrspace(1)* %201, i64 %211, i64 %200 syncscope("one-as") release monotonic, align 8
  %213 = extractvalue { i64, i1 } %212, 1
  br i1 %213, label %214, label %209

214:                                              ; preds = %181, %194, %209
  %215 = load <2 x i64>, <2 x i64> addrspace(5)* %27, align 16, !tbaa !21
  %216 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %216) #10
  %217 = bitcast %8 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #10
  %218 = bitcast %7 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #10
  %219 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #10
  %220 = bitcast %6 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %220) #10
  %221 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #10
  %222 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %222) #10
  ret <2 x i64> %215
}

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #9

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #10

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 noundef %0) unnamed_addr #11 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %1423, label %3

3:                                                ; preds = %1
  %4 = icmp ugt i64 %0, 3072
  br i1 %4, label %5, label %27

5:                                                ; preds = %3
  %6 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 24
  %8 = bitcast i8 addrspace(4)* %7 to i64 addrspace(4)*
  %9 = load i64, i64 addrspace(4)* %8, align 8, !tbaa !17
  %10 = inttoptr i64 %9 to i8 addrspace(1)*
  %11 = addrspacecast i8 addrspace(1)* %10 to i8*
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %11, i32 noundef 3, i64 noundef 0, i64 noundef %0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %13 = extractelement <2 x i64> %12, i64 0
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %5
  %16 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %17 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %17, i32 0)
  %19 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %16, i32 %18)
  %20 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %21 = icmp eq i32 %19, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %15
  %23 = tail call i64 @llvm.ctpop.i64(i64 %20), !range !31
  %24 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %23 syncscope("agent-one-as") monotonic, align 8
  br label %25

25:                                               ; preds = %22, %15, %5
  %26 = inttoptr i64 %13 to i8 addrspace(1)*
  br label %1423

27:                                               ; preds = %3
  %28 = trunc i64 %0 to i32
  %29 = tail call i32 @llvm.umax.i32(i32 %28, i32 16)
  %30 = tail call i32 @llvm.ctlz.i32(i32 %29, i1 false), !range !57
  %31 = sub nsw i32 31, %30
  %32 = and i32 %31, 31
  %33 = shl nuw i32 1, %32
  %34 = shl nuw nsw i32 %30, 1
  %35 = sub nsw i32 54, %34
  %36 = icmp ugt i32 %29, %33
  %37 = zext i1 %36 to i32
  %38 = or i32 %35, %37
  %39 = lshr i32 %33, 1
  %40 = or i32 %39, %33
  %41 = icmp ugt i32 %29, %40
  %42 = zext i1 %41 to i32
  %43 = add nsw i32 %38, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %44, i32 0
  %46 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %44, i32 0
  %47 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 2
  %48 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 2, i64 %44, i32 0
  %49 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 4, i64 %44, i32 0
  %50 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 3, i64 %44, i32 0
  %51 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 5
  %52 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 0
  %53 = lshr i64 191, %44
  %54 = and i64 %53, 1
  %55 = icmp eq i64 %54, 0
  %56 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 4
  %57 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 6
  %58 = icmp eq i32 %43, 2
  %59 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %43, i64 0
  %60 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 24
  %62 = bitcast i8 addrspace(4)* %61 to i64 addrspace(4)*
  br label %63

63:                                               ; preds = %1417, %27
  %64 = phi i32 [ 1, %27 ], [ %1418, %1417 ]
  %65 = phi i8 addrspace(1)* [ null, %27 ], [ %1419, %1417 ]
  %66 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %64) #12, !srcloc !36
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %1417, label %68

68:                                               ; preds = %63
  %69 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %43)
  %70 = icmp eq i32 %69, %43
  br i1 %70, label %71, label %1417

71:                                               ; preds = %68, %1410
  %72 = phi i32 [ %1411, %1410 ], [ %66, %68 ]
  %73 = phi i32 [ %1412, %1410 ], [ 1, %68 ]
  %74 = phi i8 addrspace(1)* [ %1413, %1410 ], [ %65, %68 ]
  %75 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %73) #12, !srcloc !36
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %1410, label %77

77:                                               ; preds = %71
  %78 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %79 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %80 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %79, i32 0)
  %81 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %78, i32 %80)
  %82 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %81) #12, !srcloc !58
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %86

84:                                               ; preds = %77
  %85 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %86

86:                                               ; preds = %84, %77
  %87 = phi i32 [ %85, %84 ], [ 0, %77 ]
  %88 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %87)
  %89 = icmp ult i32 %88, 65792
  br i1 %89, label %90, label %634

90:                                               ; preds = %86
  %91 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %92 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %93 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %92, i32 0)
  %94 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %91, i32 %93)
  %95 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %96 = tail call i64 @llvm.ctpop.i64(i64 %95), !range !31
  %97 = trunc i64 %96 to i32
  br label %98

98:                                               ; preds = %631, %90
  %99 = phi i32 [ %94, %90 ], [ %102, %631 ]
  %100 = phi i32 [ %88, %90 ], [ %632, %631 ]
  %101 = phi %3 addrspace(1)* [ undef, %90 ], [ %633, %631 ]
  %102 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %99) #12, !srcloc !58
  %103 = icmp eq i32 %100, 0
  br i1 %103, label %174, label %104

104:                                              ; preds = %98
  %105 = icmp eq i32 %102, 0
  br i1 %105, label %106, label %108

106:                                              ; preds = %104
  %107 = load atomic i32, i32 addrspace(1)* %46 syncscope("agent-one-as") monotonic, align 8
  br label %108

108:                                              ; preds = %106, %104
  %109 = phi i32 [ %107, %106 ], [ 0, %104 ]
  %110 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %109)
  %111 = add i32 %110, %102
  %112 = urem i32 %111, %100
  %113 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !59
  br label %114

114:                                              ; preds = %172, %108
  %115 = phi i32 [ %112, %108 ], [ %169, %172 ]
  %116 = phi i32 [ %100, %108 ], [ %170, %172 ]
  %117 = phi %3 addrspace(1)* [ %101, %108 ], [ %171, %172 ]
  %118 = icmp ugt i32 %115, 255
  br i1 %118, label %119, label %129

119:                                              ; preds = %114
  %120 = add i32 %115, -256
  %121 = lshr i32 %120, 8
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %122, i32 0
  %124 = load atomic i64, i64 addrspace(1)* %123 syncscope("agent-one-as") monotonic, align 8
  %125 = inttoptr i64 %124 to %3 addrspace(1)*
  %126 = and i32 %115, 255
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds %3, %3 addrspace(1)* %125, i64 %127
  br label %132

129:                                              ; preds = %114
  %130 = zext i32 %115 to i64
  %131 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %130
  br label %132

132:                                              ; preds = %129, %119
  %133 = phi %3 addrspace(1)* [ %128, %119 ], [ %131, %129 ]
  %134 = getelementptr inbounds %3, %3 addrspace(1)* %133, i64 0, i32 2
  %135 = load atomic i32, i32 addrspace(1)* %134 syncscope("agent-one-as") monotonic, align 8
  %136 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %135, i32 %113, i32 36)
  %137 = icmp eq i64 %136, 0
  br i1 %137, label %143, label %138

138:                                              ; preds = %132
  %139 = tail call i64 @llvm.cttz.i64(i64 %136, i1 true), !range !31
  %140 = trunc i64 %139 to i32
  %141 = shl nuw nsw i32 %140, 2
  %142 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %141, i32 %115)
  br label %143

143:                                              ; preds = %138, %132
  %144 = phi i32 [ %142, %138 ], [ -1, %132 ]
  %145 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %144)
  %146 = icmp eq i32 %145, -1
  br i1 %146, label %162, label %147

147:                                              ; preds = %143
  %148 = icmp ugt i32 %145, 255
  br i1 %148, label %149, label %159

149:                                              ; preds = %147
  %150 = add i32 %145, -256
  %151 = lshr i32 %150, 8
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %152, i32 0
  %154 = load atomic i64, i64 addrspace(1)* %153 syncscope("agent-one-as") monotonic, align 8
  %155 = inttoptr i64 %154 to %3 addrspace(1)*
  %156 = and i32 %145, 255
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds %3, %3 addrspace(1)* %155, i64 %157
  br label %168

159:                                              ; preds = %147
  %160 = zext i32 %145 to i64
  %161 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %160
  br label %168

162:                                              ; preds = %143
  %163 = add i32 %115, %97
  %164 = urem i32 %163, %100
  br i1 %105, label %165, label %166

165:                                              ; preds = %162
  store atomic i32 %164, i32 addrspace(1)* %46 syncscope("agent-one-as") monotonic, align 8
  br label %166

166:                                              ; preds = %165, %162
  %167 = sub i32 %116, %97
  br label %168

168:                                              ; preds = %166, %159, %149
  %169 = phi i32 [ %164, %166 ], [ %115, %149 ], [ %115, %159 ]
  %170 = phi i32 [ %167, %166 ], [ %116, %149 ], [ %116, %159 ]
  %171 = phi %3 addrspace(1)* [ %117, %166 ], [ %158, %149 ], [ %161, %159 ]
  br i1 %146, label %172, label %1299

172:                                              ; preds = %168
  %173 = icmp sgt i32 %170, 0
  br i1 %173, label %114, label %174

174:                                              ; preds = %172, %98
  %175 = phi %3 addrspace(1)* [ %101, %98 ], [ %171, %172 ]
  %176 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %177 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %178 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %177, i32 0)
  %179 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %176, i32 %178)
  br label %180

180:                                              ; preds = %548, %174
  %181 = phi i32 [ %179, %174 ], [ %550, %548 ]
  %182 = phi %3 addrspace(1)* [ undef, %174 ], [ %551, %548 ]
  %183 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %181) #12, !srcloc !58
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %187

185:                                              ; preds = %180
  %186 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %187

187:                                              ; preds = %185, %180
  %188 = phi i32 [ %186, %185 ], [ 0, %180 ]
  %189 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %188)
  %190 = icmp eq i32 %189, 65792
  br i1 %190, label %548, label %191

191:                                              ; preds = %187
  br i1 %184, label %192, label %197

192:                                              ; preds = %191
  %193 = cmpxchg i32 addrspace(1)* %48, i32 0, i32 256 syncscope("agent-one-as") monotonic monotonic, align 4
  %194 = extractvalue { i32, i1 } %193, 1
  %195 = extractvalue { i32, i1 } %193, 0
  %196 = select i1 %194, i32 256, i32 %195
  br label %197

197:                                              ; preds = %192, %191
  %198 = phi i32 [ %196, %192 ], [ 0, %191 ]
  %199 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %198)
  %200 = icmp eq i32 %189, %199
  br i1 %200, label %201, label %374

201:                                              ; preds = %197
  %202 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %203 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %204 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %203, i32 0)
  %205 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %202, i32 %204)
  %206 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %205) #12, !srcloc !58
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %210

208:                                              ; preds = %201
  %209 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %210

210:                                              ; preds = %208, %201
  %211 = phi i32 [ %209, %208 ], [ 0, %201 ]
  %212 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %211)
  %213 = icmp eq i32 %212, 65792
  br i1 %213, label %296, label %214

214:                                              ; preds = %210
  br i1 %207, label %215, label %224

215:                                              ; preds = %214
  %216 = load atomic i64, i64 addrspace(1)* %49 syncscope("agent-one-as") monotonic, align 8
  %217 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %218 = sub i64 %217, %216
  %219 = icmp ugt i64 %218, 29999
  br i1 %219, label %220, label %224

220:                                              ; preds = %215
  %221 = cmpxchg i64 addrspace(1)* %49, i64 %216, i64 %217 syncscope("agent-one-as") monotonic monotonic, align 8
  %222 = extractvalue { i64, i1 } %221, 1
  %223 = select i1 %222, i32 2, i32 1
  br label %224

224:                                              ; preds = %220, %215, %214
  %225 = phi i32 [ 1, %214 ], [ 1, %215 ], [ %223, %220 ]
  %226 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %225)
  %227 = icmp eq i32 %226, 1
  br i1 %227, label %296, label %228

228:                                              ; preds = %224
  br i1 %207, label %229, label %235

229:                                              ; preds = %228
  %230 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %231 = inttoptr i64 %230 to i8 addrspace(1)*
  %232 = addrspacecast i8 addrspace(1)* %231 to i8*
  %233 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %232, i32 noundef 3, i64 noundef 0, i64 noundef 6144, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %234 = extractelement <2 x i64> %233, i64 0
  br label %235

235:                                              ; preds = %229, %228
  %236 = phi i64 [ %234, %229 ], [ 0, %228 ]
  %237 = trunc i64 %236 to i32
  %238 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %237)
  %239 = insertelement <2 x i32> undef, i32 %238, i64 0
  %240 = lshr i64 %236, 32
  %241 = trunc i64 %240 to i32
  %242 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %241)
  %243 = insertelement <2 x i32> %239, i32 %242, i64 1
  %244 = bitcast <2 x i32> %243 to i64
  %245 = icmp eq i64 %244, 0
  br i1 %245, label %296, label %246

246:                                              ; preds = %235
  %247 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %248 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %249 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %248, i32 0)
  %250 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %247, i32 %249)
  %251 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %252 = tail call i64 @llvm.ctpop.i64(i64 %251), !range !31
  %253 = trunc i64 %252 to i32
  %254 = inttoptr i64 %244 to i64 addrspace(1)*
  %255 = icmp ult i32 %250, 768
  br i1 %255, label %256, label %262

256:                                              ; preds = %246, %256
  %257 = phi i32 [ %260, %256 ], [ %250, %246 ]
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds i64, i64 addrspace(1)* %254, i64 %258
  store i64 0, i64 addrspace(1)* %259, align 8, !tbaa !17
  %260 = add i32 %257, %253
  %261 = icmp ult i32 %260, 768
  br i1 %261, label %256, label %262

262:                                              ; preds = %256, %246
  br label %263

263:                                              ; preds = %262, %295
  %264 = phi i32 [ %293, %295 ], [ %226, %262 ]
  %265 = phi i32 [ %273, %295 ], [ %212, %262 ]
  %266 = phi i32 [ %267, %295 ], [ %206, %262 ]
  %267 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %266) #12, !srcloc !58
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %271

269:                                              ; preds = %263
  %270 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %271

271:                                              ; preds = %269, %263
  %272 = phi i32 [ %270, %269 ], [ %265, %263 ]
  %273 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %272)
  %274 = icmp eq i32 %273, 65792
  br i1 %274, label %275, label %281

275:                                              ; preds = %271
  br i1 %268, label %276, label %296

276:                                              ; preds = %275
  %277 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %278 = inttoptr i64 %277 to i8 addrspace(1)*
  %279 = addrspacecast i8 addrspace(1)* %278 to i8*
  %280 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %279, i32 noundef 3, i64 noundef %244, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %296

281:                                              ; preds = %271
  br i1 %268, label %282, label %291

282:                                              ; preds = %281
  %283 = add i32 %273, -256
  %284 = lshr i32 %283, 8
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %285, i32 0
  %287 = cmpxchg i64 addrspace(1)* %286, i64 0, i64 %244 syncscope("agent-one-as") monotonic monotonic, align 8
  %288 = extractvalue { i64, i1 } %287, 1
  br i1 %288, label %289, label %291

289:                                              ; preds = %282
  %290 = atomicrmw add i32 addrspace(1)* %48, i32 256 syncscope("agent-one-as") release, align 4
  br label %291

291:                                              ; preds = %289, %282, %281
  %292 = phi i32 [ %264, %281 ], [ 0, %289 ], [ %264, %282 ]
  %293 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %292)
  %294 = icmp eq i32 %293, 0
  br i1 %294, label %296, label %295

295:                                              ; preds = %291
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %263

296:                                              ; preds = %291, %276, %275, %235, %224, %210
  %297 = phi i32 [ 2, %210 ], [ 1, %224 ], [ %226, %235 ], [ %264, %276 ], [ %264, %275 ], [ 0, %291 ]
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %372, label %299

299:                                              ; preds = %296
  %300 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %301 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %302 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %301, i32 0)
  %303 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %300, i32 %302)
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %305, label %369

305:                                              ; preds = %299
  %306 = load atomic i64, i64 addrspace(1)* %49 syncscope("agent-one-as") monotonic, align 8
  %307 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %308 = sub i64 %307, %306
  %309 = icmp ult i64 %308, 30000
  br i1 %309, label %310, label %369

310:                                              ; preds = %305
  %311 = trunc i64 %308 to i32
  %312 = sub nuw nsw i32 30000, %311
  %313 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %314 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %312)
  %315 = sext i32 %314 to i64
  %316 = add i64 %313, %315
  %317 = add i64 %313, 1625
  %318 = icmp ugt i64 %316, %317
  br i1 %318, label %323, label %319

319:                                              ; preds = %323, %310
  %320 = phi i64 [ %313, %310 ], [ %324, %323 ]
  %321 = add i64 %320, 806
  %322 = icmp ugt i64 %316, %321
  br i1 %322, label %331, label %327

323:                                              ; preds = %310, %323
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %324 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %325 = add i64 %324, 1625
  %326 = icmp ugt i64 %316, %325
  br i1 %326, label %323, label %319

327:                                              ; preds = %331, %319
  %328 = phi i64 [ %320, %319 ], [ %332, %331 ]
  %329 = add i64 %328, 396
  %330 = icmp ugt i64 %316, %329
  br i1 %330, label %335, label %339

331:                                              ; preds = %319, %331
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %332 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %333 = add i64 %332, 806
  %334 = icmp ugt i64 %316, %333
  br i1 %334, label %331, label %327

335:                                              ; preds = %327, %335
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %336 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %337 = add i64 %336, 396
  %338 = icmp ugt i64 %316, %337
  br i1 %338, label %335, label %339

339:                                              ; preds = %335, %327
  %340 = phi i64 [ %328, %327 ], [ %336, %335 ]
  %341 = add i64 %340, 192
  %342 = icmp ugt i64 %316, %341
  br i1 %342, label %347, label %343

343:                                              ; preds = %347, %339
  %344 = phi i64 [ %340, %339 ], [ %348, %347 ]
  %345 = add i64 %344, 89
  %346 = icmp ugt i64 %316, %345
  br i1 %346, label %355, label %351

347:                                              ; preds = %339, %347
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %348 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %349 = add i64 %348, 192
  %350 = icmp ugt i64 %316, %349
  br i1 %350, label %347, label %343

351:                                              ; preds = %355, %343
  %352 = phi i64 [ %344, %343 ], [ %356, %355 ]
  %353 = add i64 %352, 38
  %354 = icmp ugt i64 %316, %353
  br i1 %354, label %362, label %359

355:                                              ; preds = %343, %355
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %356 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %357 = add i64 %356, 89
  %358 = icmp ugt i64 %316, %357
  br i1 %358, label %355, label %351

359:                                              ; preds = %362, %351
  %360 = phi i64 [ %352, %351 ], [ %363, %362 ]
  %361 = icmp ugt i64 %316, %360
  br i1 %361, label %366, label %369

362:                                              ; preds = %351, %362
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %363 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %364 = add i64 %363, 38
  %365 = icmp ugt i64 %316, %364
  br i1 %365, label %362, label %359

366:                                              ; preds = %359, %366
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %367 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %368 = icmp ugt i64 %316, %367
  br i1 %368, label %366, label %369

369:                                              ; preds = %366, %359, %305, %299
  %370 = icmp eq i32 %297, 2
  %371 = select i1 %370, %3 addrspace(1)* null, %3 addrspace(1)* inttoptr (i64 1 to %3 addrspace(1)*)
  br label %372

372:                                              ; preds = %369, %296
  %373 = phi %3 addrspace(1)* [ %371, %369 ], [ %182, %296 ]
  br i1 %298, label %374, label %548

374:                                              ; preds = %372, %197
  %375 = phi %3 addrspace(1)* [ %373, %372 ], [ %182, %197 ]
  br i1 %184, label %376, label %385

376:                                              ; preds = %374
  %377 = load atomic i64, i64 addrspace(1)* %50 syncscope("agent-one-as") monotonic, align 8
  %378 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %379 = sub i64 %378, %377
  %380 = icmp ugt i64 %379, 19999
  br i1 %380, label %381, label %385

381:                                              ; preds = %376
  %382 = cmpxchg i64 addrspace(1)* %50, i64 %377, i64 %378 syncscope("agent-one-as") monotonic monotonic, align 8
  %383 = extractvalue { i64, i1 } %382, 1
  %384 = select i1 %383, i8 addrspace(1)* null, i8 addrspace(1)* inttoptr (i64 1 to i8 addrspace(1)*)
  br label %385

385:                                              ; preds = %381, %376, %374
  %386 = phi i8 addrspace(1)* [ inttoptr (i64 1 to i8 addrspace(1)*), %374 ], [ inttoptr (i64 1 to i8 addrspace(1)*), %376 ], [ %384, %381 ]
  %387 = ptrtoint i8 addrspace(1)* %386 to i64
  %388 = trunc i64 %387 to i32
  %389 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %388)
  %390 = insertelement <2 x i32> undef, i32 %389, i64 0
  %391 = lshr i64 %387, 32
  %392 = trunc i64 %391 to i32
  %393 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %392)
  %394 = insertelement <2 x i32> %390, i32 %393, i64 1
  %395 = bitcast <2 x i32> %394 to i64
  %396 = icmp eq i64 %395, 0
  br i1 %396, label %399, label %397

397:                                              ; preds = %385
  %398 = inttoptr i64 %395 to %3 addrspace(1)*
  br label %548

399:                                              ; preds = %385
  br i1 %184, label %400, label %413

400:                                              ; preds = %399
  %401 = load atomic i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6) syncscope("agent-one-as") monotonic, align 8
  %402 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !60
  %403 = icmp ult i64 %401, %402
  br i1 %403, label %404, label %407

404:                                              ; preds = %400
  %405 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %406 = icmp ult i64 %405, %402
  br i1 %406, label %413, label %407

407:                                              ; preds = %404, %400
  %408 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %409 = inttoptr i64 %408 to i8 addrspace(1)*
  %410 = addrspacecast i8 addrspace(1)* %409 to i8*
  %411 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %410, i32 noundef 3, i64 noundef 0, i64 noundef 2097152, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %412 = extractelement <2 x i64> %411, i64 0
  br label %413

413:                                              ; preds = %407, %404, %399
  %414 = phi i64 [ 0, %399 ], [ %412, %407 ], [ %405, %404 ]
  %415 = trunc i64 %414 to i32
  %416 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %415)
  %417 = insertelement <2 x i32> undef, i32 %416, i64 0
  %418 = lshr i64 %414, 32
  %419 = trunc i64 %418 to i32
  %420 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %419)
  %421 = insertelement <2 x i32> %417, i32 %420, i64 1
  %422 = bitcast <2 x i32> %421 to i64
  %423 = icmp eq i64 %422, 0
  br i1 %423, label %548, label %424

424:                                              ; preds = %413
  %425 = inttoptr i64 %422 to %5 addrspace(1)*
  %426 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %427 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %428 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %427, i32 0)
  %429 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %426, i32 %428)
  %430 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %429) #12, !srcloc !58
  %431 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %432 = tail call i64 @llvm.ctpop.i64(i64 %431), !range !31
  %433 = trunc i64 %432 to i32
  %434 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !62
  %435 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !63
  %436 = add i32 %435, 31
  %437 = lshr i32 %436, 5
  br i1 %55, label %461, label %438

438:                                              ; preds = %424
  %439 = icmp ult i32 %430, %437
  br i1 %439, label %446, label %440

440:                                              ; preds = %446, %438
  %441 = mul i32 %434, %433
  %442 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !64
  %443 = mul i32 %434, %430
  %444 = add i32 %442, %443
  %445 = icmp ult i32 %444, %435
  br i1 %445, label %452, label %470

446:                                              ; preds = %438, %446
  %447 = phi i32 [ %450, %446 ], [ %430, %438 ]
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %448
  store i32 0, i32 addrspace(1)* %449, align 4, !tbaa !42
  %450 = add i32 %447, %433
  %451 = icmp ult i32 %450, %437
  br i1 %451, label %446, label %440

452:                                              ; preds = %440, %452
  %453 = phi i32 [ %459, %452 ], [ %444, %440 ]
  %454 = and i32 %453, 31
  %455 = shl nuw i32 1, %454
  %456 = lshr i32 %453, 5
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %457
  store i32 %455, i32 addrspace(1)* %458, align 4, !tbaa !42
  %459 = add i32 %453, %441
  %460 = icmp ult i32 %459, %435
  br i1 %460, label %452, label %470

461:                                              ; preds = %424
  %462 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !65
  %463 = icmp ult i32 %430, %437
  br i1 %463, label %464, label %470

464:                                              ; preds = %461, %464
  %465 = phi i32 [ %468, %464 ], [ %430, %461 ]
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %466
  store i32 %462, i32 addrspace(1)* %467, align 4, !tbaa !42
  %468 = add i32 %465, %433
  %469 = icmp ult i32 %468, %437
  br i1 %469, label %464, label %470

470:                                              ; preds = %452, %464, %461, %440
  %471 = icmp eq i32 %430, 0
  br i1 %471, label %472, label %483

472:                                              ; preds = %470
  br i1 %58, label %481, label %473

473:                                              ; preds = %472
  %474 = and i32 %435, 31
  %475 = shl nsw i32 -1, %474
  %476 = add nsw i32 %437, -1
  %477 = zext i32 %476 to i64
  %478 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %477
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !42
  %480 = or i32 %479, %475
  store i32 %480, i32 addrspace(1)* %478, align 4, !tbaa !42
  br label %481

481:                                              ; preds = %473, %472
  %482 = inttoptr i64 %422 to <4 x i32> addrspace(1)*
  store <4 x i32> %59, <4 x i32> addrspace(1)* %482, align 16, !tbaa !21
  br label %483

483:                                              ; preds = %481, %470
  %484 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 1
  br label %485

485:                                              ; preds = %547, %483
  %486 = phi i32 [ %199, %483 ], [ %502, %547 ]
  %487 = phi i32 [ %189, %483 ], [ %495, %547 ]
  %488 = phi i32 [ %183, %483 ], [ %489, %547 ]
  %489 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %488) #12, !srcloc !58
  %490 = icmp eq i32 %489, 0
  br i1 %490, label %491, label %493

491:                                              ; preds = %485
  %492 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %493

493:                                              ; preds = %491, %485
  %494 = phi i32 [ %492, %491 ], [ %487, %485 ]
  %495 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %494)
  %496 = icmp eq i32 %495, 65792
  br i1 %496, label %548, label %497

497:                                              ; preds = %493
  br i1 %490, label %498, label %500

498:                                              ; preds = %497
  %499 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %500

500:                                              ; preds = %498, %497
  %501 = phi i32 [ %499, %498 ], [ %486, %497 ]
  %502 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %501)
  %503 = icmp eq i32 %495, %502
  br i1 %503, label %504, label %510

504:                                              ; preds = %500
  br i1 %490, label %505, label %548

505:                                              ; preds = %504
  %506 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %507 = inttoptr i64 %506 to i8 addrspace(1)*
  %508 = addrspacecast i8 addrspace(1)* %507 to i8*
  %509 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %508, i32 noundef 3, i64 noundef %422, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %548

510:                                              ; preds = %500
  br i1 %490, label %511, label %533

511:                                              ; preds = %510
  %512 = icmp ugt i32 %495, 255
  br i1 %512, label %513, label %523

513:                                              ; preds = %511
  %514 = add i32 %495, -256
  %515 = lshr i32 %514, 8
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %516, i32 0
  %518 = load atomic i64, i64 addrspace(1)* %517 syncscope("agent-one-as") monotonic, align 8
  %519 = inttoptr i64 %518 to %3 addrspace(1)*
  %520 = and i32 %495, 255
  %521 = zext i32 %520 to i64
  %522 = getelementptr inbounds %3, %3 addrspace(1)* %519, i64 %521
  br label %526

523:                                              ; preds = %511
  %524 = zext i32 %495 to i64
  %525 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %524
  br label %526

526:                                              ; preds = %523, %513
  %527 = phi %3 addrspace(1)* [ %522, %513 ], [ %525, %523 ]
  store i32 %495, i32 addrspace(1)* %484, align 4, !tbaa !35
  %528 = getelementptr inbounds %3, %3 addrspace(1)* %527, i64 0, i32 1
  %529 = cmpxchg i64 addrspace(1)* %528, i64 0, i64 %422 syncscope("agent-one-as") monotonic monotonic, align 8
  %530 = extractvalue { i64, i1 } %529, 1
  br i1 %530, label %531, label %533

531:                                              ; preds = %526
  %532 = atomicrmw add i32 addrspace(1)* %45, i32 1 syncscope("agent-one-as") release, align 4
  br label %533

533:                                              ; preds = %531, %526, %510
  %534 = phi %3 addrspace(1)* [ null, %510 ], [ %527, %531 ], [ null, %526 ]
  %535 = ptrtoint %3 addrspace(1)* %534 to i64
  %536 = trunc i64 %535 to i32
  %537 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %536)
  %538 = insertelement <2 x i32> undef, i32 %537, i64 0
  %539 = lshr i64 %535, 32
  %540 = trunc i64 %539 to i32
  %541 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %540)
  %542 = insertelement <2 x i32> %538, i32 %541, i64 1
  %543 = bitcast <2 x i32> %542 to i64
  %544 = icmp eq i64 %543, 0
  br i1 %544, label %547, label %545

545:                                              ; preds = %533
  %546 = inttoptr i64 %543 to %3 addrspace(1)*
  br label %548

547:                                              ; preds = %533
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %485

548:                                              ; preds = %493, %545, %505, %504, %413, %397, %372, %187
  %549 = phi i1 [ false, %397 ], [ true, %505 ], [ true, %504 ], [ false, %413 ], [ false, %545 ], [ false, %187 ], [ false, %372 ], [ false, %493 ]
  %550 = phi i32 [ %183, %397 ], [ 0, %505 ], [ %489, %504 ], [ %183, %413 ], [ %489, %545 ], [ %183, %187 ], [ %183, %372 ], [ %489, %493 ]
  %551 = phi %3 addrspace(1)* [ %398, %397 ], [ %375, %505 ], [ %375, %504 ], [ null, %413 ], [ %546, %545 ], [ null, %187 ], [ %373, %372 ], [ null, %493 ]
  br i1 %549, label %180, label %552

552:                                              ; preds = %548
  %553 = icmp eq %3 addrspace(1)* %551, inttoptr (i64 1 to %3 addrspace(1)*)
  br i1 %553, label %554, label %631

554:                                              ; preds = %552
  %555 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %556 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %557 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %556, i32 0)
  %558 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %555, i32 %557)
  %559 = icmp eq i32 %558, 0
  br i1 %559, label %560, label %624

560:                                              ; preds = %554
  %561 = load atomic i64, i64 addrspace(1)* %50 syncscope("agent-one-as") monotonic, align 8
  %562 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %563 = sub i64 %562, %561
  %564 = icmp ult i64 %563, 20000
  br i1 %564, label %565, label %624

565:                                              ; preds = %560
  %566 = trunc i64 %563 to i32
  %567 = sub nuw nsw i32 20000, %566
  %568 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %569 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %567)
  %570 = sext i32 %569 to i64
  %571 = add i64 %568, %570
  %572 = add i64 %568, 1625
  %573 = icmp ugt i64 %571, %572
  br i1 %573, label %578, label %574

574:                                              ; preds = %578, %565
  %575 = phi i64 [ %568, %565 ], [ %579, %578 ]
  %576 = add i64 %575, 806
  %577 = icmp ugt i64 %571, %576
  br i1 %577, label %586, label %582

578:                                              ; preds = %565, %578
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %579 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %580 = add i64 %579, 1625
  %581 = icmp ugt i64 %571, %580
  br i1 %581, label %578, label %574

582:                                              ; preds = %586, %574
  %583 = phi i64 [ %575, %574 ], [ %587, %586 ]
  %584 = add i64 %583, 396
  %585 = icmp ugt i64 %571, %584
  br i1 %585, label %590, label %594

586:                                              ; preds = %574, %586
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %587 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %588 = add i64 %587, 806
  %589 = icmp ugt i64 %571, %588
  br i1 %589, label %586, label %582

590:                                              ; preds = %582, %590
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %591 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %592 = add i64 %591, 396
  %593 = icmp ugt i64 %571, %592
  br i1 %593, label %590, label %594

594:                                              ; preds = %590, %582
  %595 = phi i64 [ %583, %582 ], [ %591, %590 ]
  %596 = add i64 %595, 192
  %597 = icmp ugt i64 %571, %596
  br i1 %597, label %602, label %598

598:                                              ; preds = %602, %594
  %599 = phi i64 [ %595, %594 ], [ %603, %602 ]
  %600 = add i64 %599, 89
  %601 = icmp ugt i64 %571, %600
  br i1 %601, label %610, label %606

602:                                              ; preds = %594, %602
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %603 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %604 = add i64 %603, 192
  %605 = icmp ugt i64 %571, %604
  br i1 %605, label %602, label %598

606:                                              ; preds = %610, %598
  %607 = phi i64 [ %599, %598 ], [ %611, %610 ]
  %608 = add i64 %607, 38
  %609 = icmp ugt i64 %571, %608
  br i1 %609, label %617, label %614

610:                                              ; preds = %598, %610
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %611 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %612 = add i64 %611, 89
  %613 = icmp ugt i64 %571, %612
  br i1 %613, label %610, label %606

614:                                              ; preds = %617, %606
  %615 = phi i64 [ %607, %606 ], [ %618, %617 ]
  %616 = icmp ugt i64 %571, %615
  br i1 %616, label %621, label %624

617:                                              ; preds = %606, %617
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %618 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %619 = add i64 %618, 38
  %620 = icmp ugt i64 %571, %619
  br i1 %620, label %617, label %614

621:                                              ; preds = %614, %621
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %622 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %623 = icmp ugt i64 %571, %622
  br i1 %623, label %621, label %624

624:                                              ; preds = %621, %614, %560, %554
  %625 = icmp eq i32 %102, 0
  br i1 %625, label %626, label %628

626:                                              ; preds = %624
  %627 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %628

628:                                              ; preds = %626, %624
  %629 = phi i32 [ %627, %626 ], [ %100, %624 ]
  %630 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %629)
  br label %631

631:                                              ; preds = %628, %552
  %632 = phi i32 [ %630, %628 ], [ %100, %552 ]
  %633 = phi %3 addrspace(1)* [ %175, %628 ], [ %551, %552 ]
  br i1 %553, label %98, label %1299

634:                                              ; preds = %86
  %635 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %636 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %637 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %636, i32 0)
  %638 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %635, i32 %637)
  %639 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %640 = tail call i64 @llvm.ctpop.i64(i64 %639), !range !31
  %641 = trunc i64 %640 to i32
  br label %642

642:                                              ; preds = %1295, %634
  %643 = phi i32 [ %43, %634 ], [ %1297, %1295 ]
  %644 = phi i32 [ %638, %634 ], [ %646, %1295 ]
  %645 = phi %3 addrspace(1)* [ undef, %634 ], [ %1298, %1295 ]
  %646 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %644) #12, !srcloc !58
  %647 = zext i32 %643 to i64
  %648 = icmp eq i32 %646, 0
  br i1 %648, label %649, label %652

649:                                              ; preds = %642
  %650 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %647, i32 0
  %651 = load atomic i32, i32 addrspace(1)* %650 syncscope("agent-one-as") monotonic, align 8
  br label %652

652:                                              ; preds = %649, %642
  %653 = phi i32 [ %651, %649 ], [ 0, %642 ]
  %654 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %653)
  %655 = add i32 %654, %646
  %656 = urem i32 %655, 65792
  %657 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %647, i32 1
  %658 = load i32, i32 addrspace(4)* %657, align 4, !tbaa !66
  %659 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %647, i32 0
  br label %660

660:                                              ; preds = %718, %652
  %661 = phi i32 [ %656, %652 ], [ %715, %718 ]
  %662 = phi i32 [ 65792, %652 ], [ %716, %718 ]
  %663 = phi %3 addrspace(1)* [ %645, %652 ], [ %717, %718 ]
  %664 = icmp ugt i32 %661, 255
  br i1 %664, label %665, label %675

665:                                              ; preds = %660
  %666 = add i32 %661, -256
  %667 = lshr i32 %666, 8
  %668 = zext i32 %667 to i64
  %669 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %668, i32 0
  %670 = load atomic i64, i64 addrspace(1)* %669 syncscope("agent-one-as") monotonic, align 8
  %671 = inttoptr i64 %670 to %3 addrspace(1)*
  %672 = and i32 %661, 255
  %673 = zext i32 %672 to i64
  %674 = getelementptr inbounds %3, %3 addrspace(1)* %671, i64 %673
  br label %678

675:                                              ; preds = %660
  %676 = zext i32 %661 to i64
  %677 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %676
  br label %678

678:                                              ; preds = %675, %665
  %679 = phi %3 addrspace(1)* [ %674, %665 ], [ %677, %675 ]
  %680 = getelementptr inbounds %3, %3 addrspace(1)* %679, i64 0, i32 2
  %681 = load atomic i32, i32 addrspace(1)* %680 syncscope("agent-one-as") monotonic, align 8
  %682 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %681, i32 %658, i32 36)
  %683 = icmp eq i64 %682, 0
  br i1 %683, label %689, label %684

684:                                              ; preds = %678
  %685 = tail call i64 @llvm.cttz.i64(i64 %682, i1 true), !range !31
  %686 = trunc i64 %685 to i32
  %687 = shl nuw nsw i32 %686, 2
  %688 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %687, i32 %661)
  br label %689

689:                                              ; preds = %684, %678
  %690 = phi i32 [ %688, %684 ], [ -1, %678 ]
  %691 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %690)
  %692 = icmp eq i32 %691, -1
  br i1 %692, label %708, label %693

693:                                              ; preds = %689
  %694 = icmp ugt i32 %691, 255
  br i1 %694, label %695, label %705

695:                                              ; preds = %693
  %696 = add i32 %691, -256
  %697 = lshr i32 %696, 8
  %698 = zext i32 %697 to i64
  %699 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %698, i32 0
  %700 = load atomic i64, i64 addrspace(1)* %699 syncscope("agent-one-as") monotonic, align 8
  %701 = inttoptr i64 %700 to %3 addrspace(1)*
  %702 = and i32 %691, 255
  %703 = zext i32 %702 to i64
  %704 = getelementptr inbounds %3, %3 addrspace(1)* %701, i64 %703
  br label %714

705:                                              ; preds = %693
  %706 = zext i32 %691 to i64
  %707 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %706
  br label %714

708:                                              ; preds = %689
  %709 = add i32 %661, %641
  %710 = urem i32 %709, 65792
  br i1 %648, label %711, label %712

711:                                              ; preds = %708
  store atomic i32 %710, i32 addrspace(1)* %659 syncscope("agent-one-as") monotonic, align 8
  br label %712

712:                                              ; preds = %711, %708
  %713 = sub i32 %662, %641
  br label %714

714:                                              ; preds = %712, %705, %695
  %715 = phi i32 [ %710, %712 ], [ %661, %695 ], [ %661, %705 ]
  %716 = phi i32 [ %713, %712 ], [ %662, %695 ], [ %662, %705 ]
  %717 = phi %3 addrspace(1)* [ %663, %712 ], [ %704, %695 ], [ %707, %705 ]
  br i1 %692, label %718, label %1295

718:                                              ; preds = %714
  %719 = icmp sgt i32 %716, 0
  br i1 %719, label %660, label %720

720:                                              ; preds = %718
  %721 = and i32 %643, -2
  %722 = add i32 %721, 2
  %723 = icmp ne i32 %643, %43
  %724 = icmp ugt i32 %722, 15
  %725 = select i1 %723, i1 true, i1 %724
  br i1 %725, label %1295, label %726

726:                                              ; preds = %720
  br i1 %648, label %727, label %731

727:                                              ; preds = %726
  %728 = zext i32 %722 to i64
  %729 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %728, i32 0
  %730 = load atomic i32, i32 addrspace(1)* %729 syncscope("agent-one-as") monotonic, align 8
  br label %731

731:                                              ; preds = %727, %726
  %732 = phi i32 [ %730, %727 ], [ 0, %726 ]
  %733 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %732)
  %734 = icmp ult i32 %733, 65792
  br i1 %734, label %735, label %1295

735:                                              ; preds = %731
  %736 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %737 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %738 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %737, i32 0)
  %739 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %736, i32 %738)
  %740 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %741 = tail call i64 @llvm.ctpop.i64(i64 %740), !range !31
  %742 = trunc i64 %741 to i32
  %743 = zext i32 %722 to i64
  %744 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %743, i32 0
  %745 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 2
  %746 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %743, i32 0
  %747 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 2, i64 %743, i32 0
  %748 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 4, i64 %743, i32 0
  %749 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 3, i64 %743, i32 0
  %750 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 5
  %751 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 0
  %752 = lshr i64 191, %743
  %753 = and i64 %752, 1
  %754 = icmp eq i64 %753, 0
  %755 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 4
  %756 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 6
  %757 = icmp eq i32 %721, 0
  %758 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %722, i64 0
  br label %759

759:                                              ; preds = %1292, %735
  %760 = phi i32 [ %739, %735 ], [ %763, %1292 ]
  %761 = phi i32 [ %733, %735 ], [ %1293, %1292 ]
  %762 = phi %3 addrspace(1)* [ undef, %735 ], [ %1294, %1292 ]
  %763 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %760) #12, !srcloc !58
  %764 = icmp eq i32 %761, 0
  br i1 %764, label %835, label %765

765:                                              ; preds = %759
  %766 = icmp eq i32 %763, 0
  br i1 %766, label %767, label %769

767:                                              ; preds = %765
  %768 = load atomic i32, i32 addrspace(1)* %744 syncscope("agent-one-as") monotonic, align 8
  br label %769

769:                                              ; preds = %767, %765
  %770 = phi i32 [ %768, %767 ], [ 0, %765 ]
  %771 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %770)
  %772 = add i32 %771, %763
  %773 = urem i32 %772, %761
  %774 = load i32, i32 addrspace(4)* %745, align 4, !tbaa !59
  br label %775

775:                                              ; preds = %833, %769
  %776 = phi i32 [ %773, %769 ], [ %830, %833 ]
  %777 = phi i32 [ %761, %769 ], [ %831, %833 ]
  %778 = phi %3 addrspace(1)* [ %762, %769 ], [ %832, %833 ]
  %779 = icmp ugt i32 %776, 255
  br i1 %779, label %780, label %790

780:                                              ; preds = %775
  %781 = add i32 %776, -256
  %782 = lshr i32 %781, 8
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %783, i32 0
  %785 = load atomic i64, i64 addrspace(1)* %784 syncscope("agent-one-as") monotonic, align 8
  %786 = inttoptr i64 %785 to %3 addrspace(1)*
  %787 = and i32 %776, 255
  %788 = zext i32 %787 to i64
  %789 = getelementptr inbounds %3, %3 addrspace(1)* %786, i64 %788
  br label %793

790:                                              ; preds = %775
  %791 = zext i32 %776 to i64
  %792 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %791
  br label %793

793:                                              ; preds = %790, %780
  %794 = phi %3 addrspace(1)* [ %789, %780 ], [ %792, %790 ]
  %795 = getelementptr inbounds %3, %3 addrspace(1)* %794, i64 0, i32 2
  %796 = load atomic i32, i32 addrspace(1)* %795 syncscope("agent-one-as") monotonic, align 8
  %797 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %796, i32 %774, i32 36)
  %798 = icmp eq i64 %797, 0
  br i1 %798, label %804, label %799

799:                                              ; preds = %793
  %800 = tail call i64 @llvm.cttz.i64(i64 %797, i1 true), !range !31
  %801 = trunc i64 %800 to i32
  %802 = shl nuw nsw i32 %801, 2
  %803 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %802, i32 %776)
  br label %804

804:                                              ; preds = %799, %793
  %805 = phi i32 [ %803, %799 ], [ -1, %793 ]
  %806 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %805)
  %807 = icmp eq i32 %806, -1
  br i1 %807, label %823, label %808

808:                                              ; preds = %804
  %809 = icmp ugt i32 %806, 255
  br i1 %809, label %810, label %820

810:                                              ; preds = %808
  %811 = add i32 %806, -256
  %812 = lshr i32 %811, 8
  %813 = zext i32 %812 to i64
  %814 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %813, i32 0
  %815 = load atomic i64, i64 addrspace(1)* %814 syncscope("agent-one-as") monotonic, align 8
  %816 = inttoptr i64 %815 to %3 addrspace(1)*
  %817 = and i32 %806, 255
  %818 = zext i32 %817 to i64
  %819 = getelementptr inbounds %3, %3 addrspace(1)* %816, i64 %818
  br label %829

820:                                              ; preds = %808
  %821 = zext i32 %806 to i64
  %822 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %821
  br label %829

823:                                              ; preds = %804
  %824 = add i32 %776, %742
  %825 = urem i32 %824, %761
  br i1 %766, label %826, label %827

826:                                              ; preds = %823
  store atomic i32 %825, i32 addrspace(1)* %744 syncscope("agent-one-as") monotonic, align 8
  br label %827

827:                                              ; preds = %826, %823
  %828 = sub i32 %777, %742
  br label %829

829:                                              ; preds = %827, %820, %810
  %830 = phi i32 [ %825, %827 ], [ %776, %810 ], [ %776, %820 ]
  %831 = phi i32 [ %828, %827 ], [ %777, %810 ], [ %777, %820 ]
  %832 = phi %3 addrspace(1)* [ %778, %827 ], [ %819, %810 ], [ %822, %820 ]
  br i1 %807, label %833, label %1295

833:                                              ; preds = %829
  %834 = icmp sgt i32 %831, 0
  br i1 %834, label %775, label %835

835:                                              ; preds = %833, %759
  %836 = phi %3 addrspace(1)* [ %762, %759 ], [ %832, %833 ]
  %837 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %838 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %839 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %838, i32 0)
  %840 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %837, i32 %839)
  br label %841

841:                                              ; preds = %1209, %835
  %842 = phi i32 [ %840, %835 ], [ %1211, %1209 ]
  %843 = phi %3 addrspace(1)* [ undef, %835 ], [ %1212, %1209 ]
  %844 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %842) #12, !srcloc !58
  %845 = icmp eq i32 %844, 0
  br i1 %845, label %846, label %848

846:                                              ; preds = %841
  %847 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %848

848:                                              ; preds = %846, %841
  %849 = phi i32 [ %847, %846 ], [ 0, %841 ]
  %850 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %849)
  %851 = icmp eq i32 %850, 65792
  br i1 %851, label %1209, label %852

852:                                              ; preds = %848
  br i1 %845, label %853, label %858

853:                                              ; preds = %852
  %854 = cmpxchg i32 addrspace(1)* %747, i32 0, i32 256 syncscope("agent-one-as") monotonic monotonic, align 4
  %855 = extractvalue { i32, i1 } %854, 1
  %856 = extractvalue { i32, i1 } %854, 0
  %857 = select i1 %855, i32 256, i32 %856
  br label %858

858:                                              ; preds = %853, %852
  %859 = phi i32 [ %857, %853 ], [ 0, %852 ]
  %860 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %859)
  %861 = icmp eq i32 %850, %860
  br i1 %861, label %862, label %1035

862:                                              ; preds = %858
  %863 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %864 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %865 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %864, i32 0)
  %866 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %863, i32 %865)
  %867 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %866) #12, !srcloc !58
  %868 = icmp eq i32 %867, 0
  br i1 %868, label %869, label %871

869:                                              ; preds = %862
  %870 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %871

871:                                              ; preds = %869, %862
  %872 = phi i32 [ %870, %869 ], [ 0, %862 ]
  %873 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %872)
  %874 = icmp eq i32 %873, 65792
  br i1 %874, label %957, label %875

875:                                              ; preds = %871
  br i1 %868, label %876, label %885

876:                                              ; preds = %875
  %877 = load atomic i64, i64 addrspace(1)* %748 syncscope("agent-one-as") monotonic, align 8
  %878 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %879 = sub i64 %878, %877
  %880 = icmp ugt i64 %879, 29999
  br i1 %880, label %881, label %885

881:                                              ; preds = %876
  %882 = cmpxchg i64 addrspace(1)* %748, i64 %877, i64 %878 syncscope("agent-one-as") monotonic monotonic, align 8
  %883 = extractvalue { i64, i1 } %882, 1
  %884 = select i1 %883, i32 2, i32 1
  br label %885

885:                                              ; preds = %881, %876, %875
  %886 = phi i32 [ 1, %875 ], [ 1, %876 ], [ %884, %881 ]
  %887 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %886)
  %888 = icmp eq i32 %887, 1
  br i1 %888, label %957, label %889

889:                                              ; preds = %885
  br i1 %868, label %890, label %896

890:                                              ; preds = %889
  %891 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %892 = inttoptr i64 %891 to i8 addrspace(1)*
  %893 = addrspacecast i8 addrspace(1)* %892 to i8*
  %894 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %893, i32 noundef 3, i64 noundef 0, i64 noundef 6144, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %895 = extractelement <2 x i64> %894, i64 0
  br label %896

896:                                              ; preds = %890, %889
  %897 = phi i64 [ %895, %890 ], [ 0, %889 ]
  %898 = trunc i64 %897 to i32
  %899 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %898)
  %900 = insertelement <2 x i32> undef, i32 %899, i64 0
  %901 = lshr i64 %897, 32
  %902 = trunc i64 %901 to i32
  %903 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %902)
  %904 = insertelement <2 x i32> %900, i32 %903, i64 1
  %905 = bitcast <2 x i32> %904 to i64
  %906 = icmp eq i64 %905, 0
  br i1 %906, label %957, label %907

907:                                              ; preds = %896
  %908 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %909 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %910 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %909, i32 0)
  %911 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %908, i32 %910)
  %912 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %913 = tail call i64 @llvm.ctpop.i64(i64 %912), !range !31
  %914 = trunc i64 %913 to i32
  %915 = inttoptr i64 %905 to i64 addrspace(1)*
  %916 = icmp ult i32 %911, 768
  br i1 %916, label %917, label %923

917:                                              ; preds = %907, %917
  %918 = phi i32 [ %921, %917 ], [ %911, %907 ]
  %919 = zext i32 %918 to i64
  %920 = getelementptr inbounds i64, i64 addrspace(1)* %915, i64 %919
  store i64 0, i64 addrspace(1)* %920, align 8, !tbaa !17
  %921 = add i32 %918, %914
  %922 = icmp ult i32 %921, 768
  br i1 %922, label %917, label %923

923:                                              ; preds = %917, %907
  br label %924

924:                                              ; preds = %923, %956
  %925 = phi i32 [ %954, %956 ], [ %887, %923 ]
  %926 = phi i32 [ %934, %956 ], [ %873, %923 ]
  %927 = phi i32 [ %928, %956 ], [ %867, %923 ]
  %928 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %927) #12, !srcloc !58
  %929 = icmp eq i32 %928, 0
  br i1 %929, label %930, label %932

930:                                              ; preds = %924
  %931 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %932

932:                                              ; preds = %930, %924
  %933 = phi i32 [ %931, %930 ], [ %926, %924 ]
  %934 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %933)
  %935 = icmp eq i32 %934, 65792
  br i1 %935, label %936, label %942

936:                                              ; preds = %932
  br i1 %929, label %937, label %957

937:                                              ; preds = %936
  %938 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %939 = inttoptr i64 %938 to i8 addrspace(1)*
  %940 = addrspacecast i8 addrspace(1)* %939 to i8*
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %940, i32 noundef 3, i64 noundef %905, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %957

942:                                              ; preds = %932
  br i1 %929, label %943, label %952

943:                                              ; preds = %942
  %944 = add i32 %934, -256
  %945 = lshr i32 %944, 8
  %946 = zext i32 %945 to i64
  %947 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %946, i32 0
  %948 = cmpxchg i64 addrspace(1)* %947, i64 0, i64 %905 syncscope("agent-one-as") monotonic monotonic, align 8
  %949 = extractvalue { i64, i1 } %948, 1
  br i1 %949, label %950, label %952

950:                                              ; preds = %943
  %951 = atomicrmw add i32 addrspace(1)* %747, i32 256 syncscope("agent-one-as") release, align 4
  br label %952

952:                                              ; preds = %950, %943, %942
  %953 = phi i32 [ %925, %942 ], [ 0, %950 ], [ %925, %943 ]
  %954 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %953)
  %955 = icmp eq i32 %954, 0
  br i1 %955, label %957, label %956

956:                                              ; preds = %952
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %924

957:                                              ; preds = %952, %937, %936, %896, %885, %871
  %958 = phi i32 [ 2, %871 ], [ 1, %885 ], [ %887, %896 ], [ %925, %937 ], [ %925, %936 ], [ 0, %952 ]
  %959 = icmp eq i32 %958, 0
  br i1 %959, label %1033, label %960

960:                                              ; preds = %957
  %961 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %962 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %963 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %962, i32 0)
  %964 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %961, i32 %963)
  %965 = icmp eq i32 %964, 0
  br i1 %965, label %966, label %1030

966:                                              ; preds = %960
  %967 = load atomic i64, i64 addrspace(1)* %748 syncscope("agent-one-as") monotonic, align 8
  %968 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %969 = sub i64 %968, %967
  %970 = icmp ult i64 %969, 30000
  br i1 %970, label %971, label %1030

971:                                              ; preds = %966
  %972 = trunc i64 %969 to i32
  %973 = sub nuw nsw i32 30000, %972
  %974 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %975 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %973)
  %976 = sext i32 %975 to i64
  %977 = add i64 %974, %976
  %978 = add i64 %974, 1625
  %979 = icmp ugt i64 %977, %978
  br i1 %979, label %984, label %980

980:                                              ; preds = %984, %971
  %981 = phi i64 [ %974, %971 ], [ %985, %984 ]
  %982 = add i64 %981, 806
  %983 = icmp ugt i64 %977, %982
  br i1 %983, label %992, label %988

984:                                              ; preds = %971, %984
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %985 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %986 = add i64 %985, 1625
  %987 = icmp ugt i64 %977, %986
  br i1 %987, label %984, label %980

988:                                              ; preds = %992, %980
  %989 = phi i64 [ %981, %980 ], [ %993, %992 ]
  %990 = add i64 %989, 396
  %991 = icmp ugt i64 %977, %990
  br i1 %991, label %996, label %1000

992:                                              ; preds = %980, %992
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %993 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %994 = add i64 %993, 806
  %995 = icmp ugt i64 %977, %994
  br i1 %995, label %992, label %988

996:                                              ; preds = %988, %996
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %997 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %998 = add i64 %997, 396
  %999 = icmp ugt i64 %977, %998
  br i1 %999, label %996, label %1000

1000:                                             ; preds = %996, %988
  %1001 = phi i64 [ %989, %988 ], [ %997, %996 ]
  %1002 = add i64 %1001, 192
  %1003 = icmp ugt i64 %977, %1002
  br i1 %1003, label %1008, label %1004

1004:                                             ; preds = %1008, %1000
  %1005 = phi i64 [ %1001, %1000 ], [ %1009, %1008 ]
  %1006 = add i64 %1005, 89
  %1007 = icmp ugt i64 %977, %1006
  br i1 %1007, label %1016, label %1012

1008:                                             ; preds = %1000, %1008
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %1009 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1010 = add i64 %1009, 192
  %1011 = icmp ugt i64 %977, %1010
  br i1 %1011, label %1008, label %1004

1012:                                             ; preds = %1016, %1004
  %1013 = phi i64 [ %1005, %1004 ], [ %1017, %1016 ]
  %1014 = add i64 %1013, 38
  %1015 = icmp ugt i64 %977, %1014
  br i1 %1015, label %1023, label %1020

1016:                                             ; preds = %1004, %1016
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %1017 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1018 = add i64 %1017, 89
  %1019 = icmp ugt i64 %977, %1018
  br i1 %1019, label %1016, label %1012

1020:                                             ; preds = %1023, %1012
  %1021 = phi i64 [ %1013, %1012 ], [ %1024, %1023 ]
  %1022 = icmp ugt i64 %977, %1021
  br i1 %1022, label %1027, label %1030

1023:                                             ; preds = %1012, %1023
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %1024 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1025 = add i64 %1024, 38
  %1026 = icmp ugt i64 %977, %1025
  br i1 %1026, label %1023, label %1020

1027:                                             ; preds = %1020, %1027
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %1028 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1029 = icmp ugt i64 %977, %1028
  br i1 %1029, label %1027, label %1030

1030:                                             ; preds = %1027, %1020, %966, %960
  %1031 = icmp eq i32 %958, 2
  %1032 = select i1 %1031, %3 addrspace(1)* null, %3 addrspace(1)* inttoptr (i64 1 to %3 addrspace(1)*)
  br label %1033

1033:                                             ; preds = %1030, %957
  %1034 = phi %3 addrspace(1)* [ %1032, %1030 ], [ %843, %957 ]
  br i1 %959, label %1035, label %1209

1035:                                             ; preds = %1033, %858
  %1036 = phi %3 addrspace(1)* [ %1034, %1033 ], [ %843, %858 ]
  br i1 %845, label %1037, label %1046

1037:                                             ; preds = %1035
  %1038 = load atomic i64, i64 addrspace(1)* %749 syncscope("agent-one-as") monotonic, align 8
  %1039 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1040 = sub i64 %1039, %1038
  %1041 = icmp ugt i64 %1040, 19999
  br i1 %1041, label %1042, label %1046

1042:                                             ; preds = %1037
  %1043 = cmpxchg i64 addrspace(1)* %749, i64 %1038, i64 %1039 syncscope("agent-one-as") monotonic monotonic, align 8
  %1044 = extractvalue { i64, i1 } %1043, 1
  %1045 = select i1 %1044, i8 addrspace(1)* null, i8 addrspace(1)* inttoptr (i64 1 to i8 addrspace(1)*)
  br label %1046

1046:                                             ; preds = %1042, %1037, %1035
  %1047 = phi i8 addrspace(1)* [ inttoptr (i64 1 to i8 addrspace(1)*), %1035 ], [ inttoptr (i64 1 to i8 addrspace(1)*), %1037 ], [ %1045, %1042 ]
  %1048 = ptrtoint i8 addrspace(1)* %1047 to i64
  %1049 = trunc i64 %1048 to i32
  %1050 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1049)
  %1051 = insertelement <2 x i32> undef, i32 %1050, i64 0
  %1052 = lshr i64 %1048, 32
  %1053 = trunc i64 %1052 to i32
  %1054 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1053)
  %1055 = insertelement <2 x i32> %1051, i32 %1054, i64 1
  %1056 = bitcast <2 x i32> %1055 to i64
  %1057 = icmp eq i64 %1056, 0
  br i1 %1057, label %1060, label %1058

1058:                                             ; preds = %1046
  %1059 = inttoptr i64 %1056 to %3 addrspace(1)*
  br label %1209

1060:                                             ; preds = %1046
  br i1 %845, label %1061, label %1074

1061:                                             ; preds = %1060
  %1062 = load atomic i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6) syncscope("agent-one-as") monotonic, align 8
  %1063 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !60
  %1064 = icmp ult i64 %1062, %1063
  br i1 %1064, label %1065, label %1068

1065:                                             ; preds = %1061
  %1066 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %1067 = icmp ult i64 %1066, %1063
  br i1 %1067, label %1074, label %1068

1068:                                             ; preds = %1065, %1061
  %1069 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %1070 = inttoptr i64 %1069 to i8 addrspace(1)*
  %1071 = addrspacecast i8 addrspace(1)* %1070 to i8*
  %1072 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1071, i32 noundef 3, i64 noundef 0, i64 noundef 2097152, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1073 = extractelement <2 x i64> %1072, i64 0
  br label %1074

1074:                                             ; preds = %1068, %1065, %1060
  %1075 = phi i64 [ 0, %1060 ], [ %1073, %1068 ], [ %1066, %1065 ]
  %1076 = trunc i64 %1075 to i32
  %1077 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1076)
  %1078 = insertelement <2 x i32> undef, i32 %1077, i64 0
  %1079 = lshr i64 %1075, 32
  %1080 = trunc i64 %1079 to i32
  %1081 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1080)
  %1082 = insertelement <2 x i32> %1078, i32 %1081, i64 1
  %1083 = bitcast <2 x i32> %1082 to i64
  %1084 = icmp eq i64 %1083, 0
  br i1 %1084, label %1209, label %1085

1085:                                             ; preds = %1074
  %1086 = inttoptr i64 %1083 to %5 addrspace(1)*
  %1087 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %1088 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %1089 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1088, i32 0)
  %1090 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1087, i32 %1089)
  %1091 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1090) #12, !srcloc !58
  %1092 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %1093 = tail call i64 @llvm.ctpop.i64(i64 %1092), !range !31
  %1094 = trunc i64 %1093 to i32
  %1095 = load i32, i32 addrspace(4)* %750, align 4, !tbaa !62
  %1096 = load i32, i32 addrspace(4)* %751, align 4, !tbaa !63
  %1097 = add i32 %1096, 31
  %1098 = lshr i32 %1097, 5
  br i1 %754, label %1122, label %1099

1099:                                             ; preds = %1085
  %1100 = icmp ult i32 %1091, %1098
  br i1 %1100, label %1107, label %1101

1101:                                             ; preds = %1107, %1099
  %1102 = mul i32 %1095, %1094
  %1103 = load i32, i32 addrspace(4)* %755, align 4, !tbaa !64
  %1104 = mul i32 %1095, %1091
  %1105 = add i32 %1103, %1104
  %1106 = icmp ult i32 %1105, %1096
  br i1 %1106, label %1113, label %1131

1107:                                             ; preds = %1099, %1107
  %1108 = phi i32 [ %1111, %1107 ], [ %1091, %1099 ]
  %1109 = zext i32 %1108 to i64
  %1110 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1109
  store i32 0, i32 addrspace(1)* %1110, align 4, !tbaa !42
  %1111 = add i32 %1108, %1094
  %1112 = icmp ult i32 %1111, %1098
  br i1 %1112, label %1107, label %1101

1113:                                             ; preds = %1101, %1113
  %1114 = phi i32 [ %1120, %1113 ], [ %1105, %1101 ]
  %1115 = and i32 %1114, 31
  %1116 = shl nuw i32 1, %1115
  %1117 = lshr i32 %1114, 5
  %1118 = zext i32 %1117 to i64
  %1119 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1118
  store i32 %1116, i32 addrspace(1)* %1119, align 4, !tbaa !42
  %1120 = add i32 %1114, %1102
  %1121 = icmp ult i32 %1120, %1096
  br i1 %1121, label %1113, label %1131

1122:                                             ; preds = %1085
  %1123 = load i32, i32 addrspace(4)* %756, align 4, !tbaa !65
  %1124 = icmp ult i32 %1091, %1098
  br i1 %1124, label %1125, label %1131

1125:                                             ; preds = %1122, %1125
  %1126 = phi i32 [ %1129, %1125 ], [ %1091, %1122 ]
  %1127 = zext i32 %1126 to i64
  %1128 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1127
  store i32 %1123, i32 addrspace(1)* %1128, align 4, !tbaa !42
  %1129 = add i32 %1126, %1094
  %1130 = icmp ult i32 %1129, %1098
  br i1 %1130, label %1125, label %1131

1131:                                             ; preds = %1113, %1125, %1122, %1101
  %1132 = icmp eq i32 %1091, 0
  br i1 %1132, label %1133, label %1144

1133:                                             ; preds = %1131
  br i1 %757, label %1142, label %1134

1134:                                             ; preds = %1133
  %1135 = and i32 %1096, 31
  %1136 = shl nsw i32 -1, %1135
  %1137 = add nsw i32 %1098, -1
  %1138 = zext i32 %1137 to i64
  %1139 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1138
  %1140 = load i32, i32 addrspace(1)* %1139, align 4, !tbaa !42
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32 addrspace(1)* %1139, align 4, !tbaa !42
  br label %1142

1142:                                             ; preds = %1134, %1133
  %1143 = inttoptr i64 %1083 to <4 x i32> addrspace(1)*
  store <4 x i32> %758, <4 x i32> addrspace(1)* %1143, align 16, !tbaa !21
  br label %1144

1144:                                             ; preds = %1142, %1131
  %1145 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 1
  br label %1146

1146:                                             ; preds = %1208, %1144
  %1147 = phi i32 [ %860, %1144 ], [ %1163, %1208 ]
  %1148 = phi i32 [ %850, %1144 ], [ %1156, %1208 ]
  %1149 = phi i32 [ %844, %1144 ], [ %1150, %1208 ]
  %1150 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1149) #12, !srcloc !58
  %1151 = icmp eq i32 %1150, 0
  br i1 %1151, label %1152, label %1154

1152:                                             ; preds = %1146
  %1153 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %1154

1154:                                             ; preds = %1152, %1146
  %1155 = phi i32 [ %1153, %1152 ], [ %1148, %1146 ]
  %1156 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1155)
  %1157 = icmp eq i32 %1156, 65792
  br i1 %1157, label %1209, label %1158

1158:                                             ; preds = %1154
  br i1 %1151, label %1159, label %1161

1159:                                             ; preds = %1158
  %1160 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %1161

1161:                                             ; preds = %1159, %1158
  %1162 = phi i32 [ %1160, %1159 ], [ %1147, %1158 ]
  %1163 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1162)
  %1164 = icmp eq i32 %1156, %1163
  br i1 %1164, label %1165, label %1171

1165:                                             ; preds = %1161
  br i1 %1151, label %1166, label %1209

1166:                                             ; preds = %1165
  %1167 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !17
  %1168 = inttoptr i64 %1167 to i8 addrspace(1)*
  %1169 = addrspacecast i8 addrspace(1)* %1168 to i8*
  %1170 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1169, i32 noundef 3, i64 noundef %1083, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1209

1171:                                             ; preds = %1161
  br i1 %1151, label %1172, label %1194

1172:                                             ; preds = %1171
  %1173 = icmp ugt i32 %1156, 255
  br i1 %1173, label %1174, label %1184

1174:                                             ; preds = %1172
  %1175 = add i32 %1156, -256
  %1176 = lshr i32 %1175, 8
  %1177 = zext i32 %1176 to i64
  %1178 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %1177, i32 0
  %1179 = load atomic i64, i64 addrspace(1)* %1178 syncscope("agent-one-as") monotonic, align 8
  %1180 = inttoptr i64 %1179 to %3 addrspace(1)*
  %1181 = and i32 %1156, 255
  %1182 = zext i32 %1181 to i64
  %1183 = getelementptr inbounds %3, %3 addrspace(1)* %1180, i64 %1182
  br label %1187

1184:                                             ; preds = %1172
  %1185 = zext i32 %1156 to i64
  %1186 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %1185
  br label %1187

1187:                                             ; preds = %1184, %1174
  %1188 = phi %3 addrspace(1)* [ %1183, %1174 ], [ %1186, %1184 ]
  store i32 %1156, i32 addrspace(1)* %1145, align 4, !tbaa !35
  %1189 = getelementptr inbounds %3, %3 addrspace(1)* %1188, i64 0, i32 1
  %1190 = cmpxchg i64 addrspace(1)* %1189, i64 0, i64 %1083 syncscope("agent-one-as") monotonic monotonic, align 8
  %1191 = extractvalue { i64, i1 } %1190, 1
  br i1 %1191, label %1192, label %1194

1192:                                             ; preds = %1187
  %1193 = atomicrmw add i32 addrspace(1)* %746, i32 1 syncscope("agent-one-as") release, align 4
  br label %1194

1194:                                             ; preds = %1192, %1187, %1171
  %1195 = phi %3 addrspace(1)* [ null, %1171 ], [ %1188, %1192 ], [ null, %1187 ]
  %1196 = ptrtoint %3 addrspace(1)* %1195 to i64
  %1197 = trunc i64 %1196 to i32
  %1198 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1197)
  %1199 = insertelement <2 x i32> undef, i32 %1198, i64 0
  %1200 = lshr i64 %1196, 32
  %1201 = trunc i64 %1200 to i32
  %1202 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1201)
  %1203 = insertelement <2 x i32> %1199, i32 %1202, i64 1
  %1204 = bitcast <2 x i32> %1203 to i64
  %1205 = icmp eq i64 %1204, 0
  br i1 %1205, label %1208, label %1206

1206:                                             ; preds = %1194
  %1207 = inttoptr i64 %1204 to %3 addrspace(1)*
  br label %1209

1208:                                             ; preds = %1194
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %1146

1209:                                             ; preds = %1154, %1206, %1166, %1165, %1074, %1058, %1033, %848
  %1210 = phi i1 [ false, %1058 ], [ true, %1166 ], [ true, %1165 ], [ false, %1074 ], [ false, %1206 ], [ false, %848 ], [ false, %1033 ], [ false, %1154 ]
  %1211 = phi i32 [ %844, %1058 ], [ 0, %1166 ], [ %1150, %1165 ], [ %844, %1074 ], [ %1150, %1206 ], [ %844, %848 ], [ %844, %1033 ], [ %1150, %1154 ]
  %1212 = phi %3 addrspace(1)* [ %1059, %1058 ], [ %1036, %1166 ], [ %1036, %1165 ], [ null, %1074 ], [ %1207, %1206 ], [ null, %848 ], [ %1034, %1033 ], [ null, %1154 ]
  br i1 %1210, label %841, label %1213

1213:                                             ; preds = %1209
  %1214 = icmp eq %3 addrspace(1)* %1212, inttoptr (i64 1 to %3 addrspace(1)*)
  br i1 %1214, label %1215, label %1292

1215:                                             ; preds = %1213
  %1216 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %1217 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %1218 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1217, i32 0)
  %1219 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1216, i32 %1218)
  %1220 = icmp eq i32 %1219, 0
  br i1 %1220, label %1221, label %1285

1221:                                             ; preds = %1215
  %1222 = load atomic i64, i64 addrspace(1)* %749 syncscope("agent-one-as") monotonic, align 8
  %1223 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1224 = sub i64 %1223, %1222
  %1225 = icmp ult i64 %1224, 20000
  br i1 %1225, label %1226, label %1285

1226:                                             ; preds = %1221
  %1227 = trunc i64 %1224 to i32
  %1228 = sub nuw nsw i32 20000, %1227
  %1229 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1230 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1228)
  %1231 = sext i32 %1230 to i64
  %1232 = add i64 %1229, %1231
  %1233 = add i64 %1229, 1625
  %1234 = icmp ugt i64 %1232, %1233
  br i1 %1234, label %1239, label %1235

1235:                                             ; preds = %1239, %1226
  %1236 = phi i64 [ %1229, %1226 ], [ %1240, %1239 ]
  %1237 = add i64 %1236, 806
  %1238 = icmp ugt i64 %1232, %1237
  br i1 %1238, label %1247, label %1243

1239:                                             ; preds = %1226, %1239
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %1240 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1241 = add i64 %1240, 1625
  %1242 = icmp ugt i64 %1232, %1241
  br i1 %1242, label %1239, label %1235

1243:                                             ; preds = %1247, %1235
  %1244 = phi i64 [ %1236, %1235 ], [ %1248, %1247 ]
  %1245 = add i64 %1244, 396
  %1246 = icmp ugt i64 %1232, %1245
  br i1 %1246, label %1251, label %1255

1247:                                             ; preds = %1235, %1247
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %1248 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1249 = add i64 %1248, 806
  %1250 = icmp ugt i64 %1232, %1249
  br i1 %1250, label %1247, label %1243

1251:                                             ; preds = %1243, %1251
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %1252 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1253 = add i64 %1252, 396
  %1254 = icmp ugt i64 %1232, %1253
  br i1 %1254, label %1251, label %1255

1255:                                             ; preds = %1251, %1243
  %1256 = phi i64 [ %1244, %1243 ], [ %1252, %1251 ]
  %1257 = add i64 %1256, 192
  %1258 = icmp ugt i64 %1232, %1257
  br i1 %1258, label %1263, label %1259

1259:                                             ; preds = %1263, %1255
  %1260 = phi i64 [ %1256, %1255 ], [ %1264, %1263 ]
  %1261 = add i64 %1260, 89
  %1262 = icmp ugt i64 %1232, %1261
  br i1 %1262, label %1271, label %1267

1263:                                             ; preds = %1255, %1263
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %1264 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1265 = add i64 %1264, 192
  %1266 = icmp ugt i64 %1232, %1265
  br i1 %1266, label %1263, label %1259

1267:                                             ; preds = %1271, %1259
  %1268 = phi i64 [ %1260, %1259 ], [ %1272, %1271 ]
  %1269 = add i64 %1268, 38
  %1270 = icmp ugt i64 %1232, %1269
  br i1 %1270, label %1278, label %1275

1271:                                             ; preds = %1259, %1271
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %1272 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1273 = add i64 %1272, 89
  %1274 = icmp ugt i64 %1232, %1273
  br i1 %1274, label %1271, label %1267

1275:                                             ; preds = %1278, %1267
  %1276 = phi i64 [ %1268, %1267 ], [ %1279, %1278 ]
  %1277 = icmp ugt i64 %1232, %1276
  br i1 %1277, label %1282, label %1285

1278:                                             ; preds = %1267, %1278
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %1279 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1280 = add i64 %1279, 38
  %1281 = icmp ugt i64 %1232, %1280
  br i1 %1281, label %1278, label %1275

1282:                                             ; preds = %1275, %1282
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %1283 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1284 = icmp ugt i64 %1232, %1283
  br i1 %1284, label %1282, label %1285

1285:                                             ; preds = %1282, %1275, %1221, %1215
  %1286 = icmp eq i32 %763, 0
  br i1 %1286, label %1287, label %1289

1287:                                             ; preds = %1285
  %1288 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %1289

1289:                                             ; preds = %1287, %1285
  %1290 = phi i32 [ %1288, %1287 ], [ %761, %1285 ]
  %1291 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1290)
  br label %1292

1292:                                             ; preds = %1289, %1213
  %1293 = phi i32 [ %1291, %1289 ], [ %761, %1213 ]
  %1294 = phi %3 addrspace(1)* [ %836, %1289 ], [ %1212, %1213 ]
  br i1 %1214, label %759, label %1295

1295:                                             ; preds = %714, %1292, %829, %731, %720
  %1296 = phi i1 [ false, %720 ], [ true, %731 ], [ false, %829 ], [ false, %1292 ], [ false, %714 ]
  %1297 = phi i32 [ %643, %720 ], [ %722, %731 ], [ %43, %829 ], [ %43, %1292 ], [ %643, %714 ]
  %1298 = phi %3 addrspace(1)* [ null, %720 ], [ %717, %731 ], [ %832, %829 ], [ %1294, %1292 ], [ %717, %714 ]
  br i1 %1296, label %642, label %1299

1299:                                             ; preds = %1295, %631, %168
  %1300 = phi %3 addrspace(1)* [ %171, %168 ], [ %633, %631 ], [ %1298, %1295 ]
  %1301 = ptrtoint %3 addrspace(1)* %1300 to i64
  %1302 = trunc i64 %1301 to i32
  %1303 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1302)
  %1304 = insertelement <2 x i32> undef, i32 %1303, i64 0
  %1305 = lshr i64 %1301, 32
  %1306 = trunc i64 %1305 to i32
  %1307 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1306)
  %1308 = insertelement <2 x i32> %1304, i32 %1307, i64 1
  %1309 = bitcast <2 x i32> %1308 to i64
  %1310 = icmp eq i64 %1309, 0
  br i1 %1310, label %1410, label %1311

1311:                                             ; preds = %1299
  %1312 = inttoptr i64 %1309 to %3 addrspace(1)*
  %1313 = tail call i32 @llvm.read_register.i32(metadata !28) #13
  %1314 = tail call i32 @llvm.read_register.i32(metadata !29) #13
  %1315 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1314, i32 0)
  %1316 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1313, i32 %1315)
  %1317 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1316) #12, !srcloc !58
  %1318 = tail call i64 @llvm.read_register.i64(metadata !30) #13
  %1319 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 1
  %1320 = load atomic i64, i64 addrspace(1)* %1319 seq_cst, align 8, !tbaa !67
  %1321 = inttoptr i64 %1320 to %5 addrspace(1)*
  %1322 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 0
  %1323 = load i32, i32 addrspace(1)* %1322, align 4, !tbaa !32
  %1324 = icmp eq i32 %1317, 0
  br i1 %1324, label %1325, label %1330

1325:                                             ; preds = %1311
  %1326 = tail call i64 @llvm.ctpop.i64(i64 %1318), !range !31
  %1327 = trunc i64 %1326 to i32
  %1328 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 2
  %1329 = atomicrmw add i32 addrspace(1)* %1328, i32 %1327 syncscope("agent-one-as") monotonic, align 4
  br label %1330

1330:                                             ; preds = %1325, %1311
  %1331 = phi i32 [ %1329, %1325 ], [ 0, %1311 ]
  %1332 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1331)
  %1333 = zext i32 %1323 to i64
  %1334 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 0
  %1335 = load i32, i32 addrspace(4)* %1334, align 4, !tbaa !63
  %1336 = add i32 %1335, 31
  %1337 = lshr i32 %1336, 5
  %1338 = icmp ult i32 %1336, 32
  br i1 %1338, label %1397, label %1339

1339:                                             ; preds = %1330
  %1340 = add i32 %1332, %1317
  %1341 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 7
  %1342 = load i32, i32 addrspace(4)* %1341, align 4, !tbaa !69
  %1343 = mul i32 %1342, %1340
  %1344 = urem i32 %1343, %1335
  %1345 = lshr i32 %1344, 5
  %1346 = inttoptr i64 %1320 to i8 addrspace(1)*
  %1347 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 3
  %1348 = lshr i32 %1323, 1
  %1349 = add nuw i32 %1348, 4
  %1350 = and i32 %1349, 31
  %1351 = shl nuw i32 1, %1350
  %1352 = and i32 %1323, 1
  %1353 = icmp eq i32 %1352, 0
  %1354 = lshr i32 %1351, 1
  %1355 = select i1 %1353, i32 0, i32 %1354
  %1356 = add nuw i32 %1355, %1351
  br label %1357

1357:                                             ; preds = %1389, %1339
  %1358 = phi i32 [ %1345, %1339 ], [ %1392, %1389 ]
  %1359 = phi i8 addrspace(1)* [ null, %1339 ], [ %1391, %1389 ]
  %1360 = phi i32 [ 0, %1339 ], [ %1394, %1389 ]
  %1361 = zext i32 %1358 to i64
  %1362 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 4, i64 %1361
  %1363 = load atomic i32, i32 addrspace(1)* %1362 syncscope("agent-one-as") monotonic, align 4
  %1364 = icmp eq i32 %1363, -1
  br i1 %1364, label %1385, label %1365

1365:                                             ; preds = %1357
  %1366 = xor i32 %1363, -1
  %1367 = tail call i32 @llvm.cttz.i32(i32 %1366, i1 false), !range !57
  %1368 = and i32 %1367, 31
  %1369 = shl nuw i32 1, %1368
  %1370 = atomicrmw or i32 addrspace(1)* %1362, i32 %1369 syncscope("agent-one-as") monotonic, align 4
  %1371 = and i32 %1370, %1369
  %1372 = icmp eq i32 %1371, 0
  br i1 %1372, label %1373, label %1382

1373:                                             ; preds = %1365
  %1374 = shl i32 %1358, 5
  %1375 = add i32 %1367, %1374
  %1376 = load i32, i32 addrspace(4)* %1347, align 4, !tbaa !37
  %1377 = zext i32 %1376 to i64
  %1378 = getelementptr inbounds i8, i8 addrspace(1)* %1346, i64 %1377
  %1379 = mul i32 %1375, %1356
  %1380 = zext i32 %1379 to i64
  %1381 = getelementptr inbounds i8, i8 addrspace(1)* %1378, i64 %1380
  br label %1382

1382:                                             ; preds = %1373, %1365
  %1383 = phi i32 [ 2, %1373 ], [ 0, %1365 ]
  %1384 = phi i8 addrspace(1)* [ %1381, %1373 ], [ %1359, %1365 ]
  br i1 %1372, label %1389, label %1385

1385:                                             ; preds = %1382, %1357
  %1386 = phi i8 addrspace(1)* [ %1384, %1382 ], [ %1359, %1357 ]
  %1387 = add i32 %1358, 1
  %1388 = urem i32 %1387, %1337
  br label %1389

1389:                                             ; preds = %1385, %1382
  %1390 = phi i32 [ 0, %1385 ], [ %1383, %1382 ]
  %1391 = phi i8 addrspace(1)* [ %1386, %1385 ], [ %1384, %1382 ]
  %1392 = phi i32 [ %1388, %1385 ], [ %1358, %1382 ]
  %1393 = icmp eq i32 %1390, 0
  %1394 = add nuw nsw i32 %1360, 1
  %1395 = icmp ult i32 %1394, %1337
  %1396 = select i1 %1393, i1 %1395, i1 false
  br i1 %1396, label %1357, label %1397

1397:                                             ; preds = %1389, %1330
  %1398 = phi i8 addrspace(1)* [ null, %1330 ], [ %1391, %1389 ]
  %1399 = ptrtoint i8 addrspace(1)* %1398 to i64
  %1400 = tail call i64 @llvm.amdgcn.icmp.i64.i64(i64 noundef %1399, i64 noundef 0, i32 noundef 33) #14
  br i1 %1324, label %1401, label %1406

1401:                                             ; preds = %1397
  %1402 = tail call i64 @llvm.ctpop.i64(i64 %1400), !range !31
  %1403 = trunc i64 %1402 to i32
  %1404 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 2
  %1405 = atomicrmw add i32 addrspace(1)* %1404, i32 %1403 syncscope("agent-one-as") monotonic, align 4
  br label %1406

1406:                                             ; preds = %1401, %1397
  %1407 = icmp eq i8 addrspace(1)* %1398, null
  %1408 = select i1 %1407, i32 %72, i32 0
  %1409 = select i1 %1407, i32 %75, i32 0
  br label %1410

1410:                                             ; preds = %1406, %1299, %71
  %1411 = phi i32 [ %72, %71 ], [ %1408, %1406 ], [ 0, %1299 ]
  %1412 = phi i32 [ 0, %71 ], [ %1409, %1406 ], [ 0, %1299 ]
  %1413 = phi i8 addrspace(1)* [ %74, %71 ], [ %1398, %1406 ], [ %74, %1299 ]
  %1414 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1412) #12, !srcloc !39
  %1415 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1414, i32 noundef 0, i32 noundef 33) #14
  %1416 = icmp eq i64 %1415, 0
  br i1 %1416, label %1417, label %71

1417:                                             ; preds = %1410, %68, %63
  %1418 = phi i32 [ 0, %63 ], [ %66, %68 ], [ %1411, %1410 ]
  %1419 = phi i8 addrspace(1)* [ %65, %63 ], [ %65, %68 ], [ %1413, %1410 ]
  %1420 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1418) #12, !srcloc !39
  %1421 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1420, i32 noundef 0, i32 noundef 33) #14
  %1422 = icmp eq i64 %1421, 0
  br i1 %1422, label %1423, label %63

1423:                                             ; preds = %1417, %25, %1
  %1424 = phi i8 addrspace(1)* [ %26, %25 ], [ null, %1 ], [ %1419, %1417 ]
  ret i8 addrspace(1)* %1424
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #4

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.ds.bpermute(i32, i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i64(i64, i64, i32 immarg) #6

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #5

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent noinline norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #3 = { nofree nounwind readonly }
attributes #4 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #8 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #9 = { mustprogress nounwind willreturn }
attributes #10 = { nounwind }
attributes #11 = { convergent noinline norecurse nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { convergent nounwind }
attributes #13 = { convergent }
attributes #14 = { convergent nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = !{!18, !18, i64 0}
!18 = !{!"long", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C/C++ TBAA"}
!21 = !{!19, !19, i64 0}
!22 = distinct !{!22, !13}
!23 = distinct !{!23, !11}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !13}
!27 = distinct !{!27, !11}
!28 = !{!"exec_hi"}
!29 = !{!"exec_lo"}
!30 = !{!"exec"}
!31 = !{i64 0, i64 65}
!32 = !{!33, !34, i64 0}
!33 = !{!"slab_s", !34, i64 0, !34, i64 4, !19, i64 8, !34, i64 12, !19, i64 16}
!34 = !{!"int", !19, i64 0}
!35 = !{!33, !34, i64 4}
!36 = !{i64 7014}
!37 = !{!38, !34, i64 12}
!38 = !{!"kind_info_s", !34, i64 0, !34, i64 4, !34, i64 8, !34, i64 12, !34, i64 16, !34, i64 20, !34, i64 24, !34, i64 28}
!39 = !{i64 751}
!40 = !{!41, !41, i64 0}
!41 = !{!"any pointer", !19, i64 0}
!42 = !{!34, !34, i64 0}
!43 = !{i64 2662}
!44 = !{!45, !41, i64 0}
!45 = !{!"", !41, i64 0, !41, i64 8, !46, i64 16, !18, i64 24, !18, i64 32, !18, i64 40}
!46 = !{!"hsa_signal_s", !18, i64 0}
!47 = !{!45, !18, i64 40}
!48 = !{!45, !41, i64 8}
!49 = !{!50, !34, i64 16}
!50 = !{!"", !18, i64 0, !18, i64 8, !34, i64 16, !34, i64 20}
!51 = !{!50, !18, i64 8}
!52 = !{!50, !34, i64 20}
!53 = !{!50, !18, i64 0}
!54 = !{!55, !18, i64 16}
!55 = !{!"amd_signal_s", !18, i64 0, !19, i64 8, !18, i64 16, !34, i64 24, !34, i64 28, !18, i64 32, !18, i64 40, !19, i64 48, !19, i64 56}
!56 = !{!55, !34, i64 24}
!57 = !{i32 0, i32 33}
!58 = !{i64 7137}
!59 = !{!38, !34, i64 8}
!60 = !{!61, !18, i64 108552}
!61 = !{!"heap_s", !19, i64 0, !19, i64 2048, !19, i64 4096, !19, i64 6144, !19, i64 8192, !19, i64 10240, !19, i64 108544, !18, i64 108552, !19, i64 108560, !19, i64 108672}
!62 = !{!38, !34, i64 20}
!63 = !{!38, !34, i64 0}
!64 = !{!38, !34, i64 16}
!65 = !{!38, !34, i64 24}
!66 = !{!38, !34, i64 4}
!67 = !{!68, !19, i64 8}
!68 = !{!"sdata_s", !19, i64 0, !19, i64 8, !19, i64 16}
!69 = !{!38, !34, i64 28}
