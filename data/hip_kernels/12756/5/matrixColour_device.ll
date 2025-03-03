; ModuleID = '../data/hip_kernels/12756/5/main.cu'
source_filename = "../data/hip_kernels/12756/5/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [27 x i8] c"Block = %d ; Thread = %d \0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [43 x i8] c"Block = %d ; Thread = %d First For i = %d\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [44 x i8] c"Block = %d ; Thread = %d Second For i = %d\0A\00", align 1
@0 = internal addrspace(1) global %0 zeroinitializer, align 8
@1 = internal unnamed_addr addrspace(4) constant [16 x %4] [%4 { i32 130054, i32 129546, i32 110114, i32 16288, i32 6, i32 256, i32 0, i32 4195 }, %4 { i32 86927, i32 86758, i32 73744, i32 10904, i32 399, i32 512, i32 0, i32 2804 }, %4 { i32 65280, i32 64770, i32 55054, i32 8192, i32 0, i32 128, i32 0, i32 2107 }, %4 { i32 43576, i32 43406, i32 36895, i32 5504, i32 56, i32 256, i32 0, i32 1405 }, %4 { i32 32703, i32 32193, i32 27364, i32 4160, i32 63, i32 64, i32 0, i32 1054 }, %4 { i32 21816, i32 21646, i32 18399, i32 2816, i32 56, i32 128, i32 0, i32 703 }, %4 { i32 16367, i32 15856, i32 13477, i32 2176, i32 15, i32 32, i32 32768, i32 527 }, %4 { i32 10915, i32 10745, i32 9133, i32 1472, i32 35, i32 64, i32 0, i32 352 }, %4 { i32 8187, i32 7676, i32 6524, i32 1280, i32 11, i32 16, i32 134219776, i32 265 }, %4 { i32 5459, i32 5289, i32 4495, i32 896, i32 19, i32 32, i32 524288, i32 176 }, %4 { i32 4094, i32 3583, i32 3045, i32 1024, i32 6, i32 8, i32 1077952576, i32 133 }, %4 { i32 2730, i32 2560, i32 2176, i32 512, i32 10, i32 16, i32 67109888, i32 89 }, %4 { i32 2047, i32 1536, i32 1305, i32 1024, i32 3, i32 4, i32 -2004318072, i32 66 }, %4 { i32 1365, i32 1195, i32 1015, i32 512, i32 5, i32 8, i32 538976288, i32 44 }, %4 { i32 1023, i32 512, i32 435, i32 2048, i32 1, i32 2, i32 -1431655766, i32 34 }, %4 { i32 682, i32 512, i32 435, i32 2048, i32 2, i32 4, i32 1145324612, i32 35 }], align 4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z12matrixColourPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = add i32 %9, 1
  %14 = add nuw nsw i32 %11, 1
  %15 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 24
  %17 = bitcast i8 addrspace(4)* %16 to i64 addrspace(4)*
  %18 = load i64, i64 addrspace(4)* %17, align 8, !tbaa !7
  %19 = inttoptr i64 %18 to i8 addrspace(1)*
  %20 = addrspacecast i8 addrspace(1)* %19 to i8*
  %21 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %22 = extractelement <2 x i64> %21, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %23, label %27

23:                                               ; preds = %3
  %24 = and i64 %22, -225
  %25 = or i64 %24, 32
  %26 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %25, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %468

27:                                               ; preds = %3
  %28 = and i64 %22, 2
  %29 = and i64 %22, -3
  %30 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %29, i64 0
  br label %31

31:                                               ; preds = %457, %27
  %32 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 26) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([27 x i8]* addrspacecast ([27 x i8] addrspace(4)* @.str to [27 x i8]*) to i64)), i64 1))), %27 ], [ %465, %457 ]
  %33 = phi i8 addrspace(4)* [ getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 0), %27 ], [ %466, %457 ]
  %34 = phi <2 x i64> [ %30, %27 ], [ %464, %457 ]
  %35 = icmp ugt i64 %32, 56
  %36 = extractelement <2 x i64> %34, i64 0
  %37 = or i64 %36, %28
  %38 = insertelement <2 x i64> poison, i64 %37, i64 0
  %39 = select i1 %35, <2 x i64> %34, <2 x i64> %38
  %40 = tail call i64 @llvm.umin.i64(i64 %32, i64 56)
  %41 = trunc i64 %40 to i32
  %42 = extractelement <2 x i64> %39, i64 0
  %43 = icmp ugt i32 %41, 7
  br i1 %43, label %46, label %44

44:                                               ; preds = %31
  %45 = icmp eq i32 %41, 0
  br i1 %45, label %99, label %86

46:                                               ; preds = %31
  %47 = load i8, i8 addrspace(4)* %33, align 1, !tbaa !11
  %48 = zext i8 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 1
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !11
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 8
  %53 = or i64 %52, %48
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 2
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !11
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 16
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 3
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !11
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 24
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 4
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !11
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 32
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 5
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !11
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 40
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 6
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !11
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 48
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 7
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !11
  %81 = zext i8 %80 to i64
  %82 = shl nuw i64 %81, 56
  %83 = or i64 %78, %82
  %84 = add nsw i32 %41, -8
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 8
  br label %99

86:                                               ; preds = %44, %86
  %87 = phi i32 [ %97, %86 ], [ 0, %44 ]
  %88 = phi i64 [ %96, %86 ], [ 0, %44 ]
  %89 = zext i32 %87 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 %89
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !11
  %92 = zext i8 %91 to i64
  %93 = shl i32 %87, 3
  %94 = zext i32 %93 to i64
  %95 = shl nuw i64 %92, %94
  %96 = or i64 %95, %88
  %97 = add nuw nsw i32 %87, 1
  %98 = icmp eq i32 %97, %41
  br i1 %98, label %99, label %86, !llvm.loop !12

99:                                               ; preds = %86, %46, %44
  %100 = phi i8 addrspace(4)* [ %85, %46 ], [ %33, %44 ], [ %33, %86 ]
  %101 = phi i32 [ %84, %46 ], [ 0, %44 ], [ 0, %86 ]
  %102 = phi i64 [ %83, %46 ], [ 0, %44 ], [ %96, %86 ]
  %103 = icmp ugt i32 %101, 7
  br i1 %103, label %106, label %104

104:                                              ; preds = %99
  %105 = icmp eq i32 %101, 0
  br i1 %105, label %159, label %146

106:                                              ; preds = %99
  %107 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !11
  %108 = zext i8 %107 to i64
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 1
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !11
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 8
  %113 = or i64 %112, %108
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 2
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !11
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 16
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 3
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !11
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 24
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 4
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !11
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 32
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 5
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !11
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 40
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 6
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !11
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 48
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 7
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !11
  %141 = zext i8 %140 to i64
  %142 = shl nuw i64 %141, 56
  %143 = or i64 %138, %142
  %144 = add nsw i32 %101, -8
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 8
  br label %159

146:                                              ; preds = %104, %146
  %147 = phi i32 [ %157, %146 ], [ 0, %104 ]
  %148 = phi i64 [ %156, %146 ], [ 0, %104 ]
  %149 = zext i32 %147 to i64
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 %149
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !11
  %152 = zext i8 %151 to i64
  %153 = shl i32 %147, 3
  %154 = zext i32 %153 to i64
  %155 = shl nuw i64 %152, %154
  %156 = or i64 %155, %148
  %157 = add nuw nsw i32 %147, 1
  %158 = icmp eq i32 %157, %101
  br i1 %158, label %159, label %146

159:                                              ; preds = %146, %106, %104
  %160 = phi i8 addrspace(4)* [ %145, %106 ], [ %100, %104 ], [ %100, %146 ]
  %161 = phi i32 [ %144, %106 ], [ 0, %104 ], [ 0, %146 ]
  %162 = phi i64 [ %143, %106 ], [ 0, %104 ], [ %156, %146 ]
  %163 = icmp ugt i32 %161, 7
  br i1 %163, label %166, label %164

164:                                              ; preds = %159
  %165 = icmp eq i32 %161, 0
  br i1 %165, label %219, label %206

166:                                              ; preds = %159
  %167 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !11
  %168 = zext i8 %167 to i64
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 1
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !11
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 8
  %173 = or i64 %172, %168
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 2
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !11
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 16
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 3
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !11
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 24
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 4
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !11
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 32
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 5
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !11
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 40
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 6
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !11
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 48
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 7
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !11
  %201 = zext i8 %200 to i64
  %202 = shl nuw i64 %201, 56
  %203 = or i64 %198, %202
  %204 = add nsw i32 %161, -8
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 8
  br label %219

206:                                              ; preds = %164, %206
  %207 = phi i32 [ %217, %206 ], [ 0, %164 ]
  %208 = phi i64 [ %216, %206 ], [ 0, %164 ]
  %209 = zext i32 %207 to i64
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 %209
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !11
  %212 = zext i8 %211 to i64
  %213 = shl i32 %207, 3
  %214 = zext i32 %213 to i64
  %215 = shl nuw i64 %212, %214
  %216 = or i64 %215, %208
  %217 = add nuw nsw i32 %207, 1
  %218 = icmp eq i32 %217, %161
  br i1 %218, label %219, label %206

219:                                              ; preds = %206, %166, %164
  %220 = phi i8 addrspace(4)* [ %205, %166 ], [ %160, %164 ], [ %160, %206 ]
  %221 = phi i32 [ %204, %166 ], [ 0, %164 ], [ 0, %206 ]
  %222 = phi i64 [ %203, %166 ], [ 0, %164 ], [ %216, %206 ]
  %223 = icmp ugt i32 %221, 7
  br i1 %223, label %226, label %224

224:                                              ; preds = %219
  %225 = icmp eq i32 %221, 0
  br i1 %225, label %279, label %266

226:                                              ; preds = %219
  %227 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !11
  %228 = zext i8 %227 to i64
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 1
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !11
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 8
  %233 = or i64 %232, %228
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 2
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !11
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 16
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 3
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !11
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 24
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 4
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !11
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 32
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 5
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !11
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 40
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 6
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !11
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 48
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 7
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !11
  %261 = zext i8 %260 to i64
  %262 = shl nuw i64 %261, 56
  %263 = or i64 %258, %262
  %264 = add nsw i32 %221, -8
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 8
  br label %279

266:                                              ; preds = %224, %266
  %267 = phi i32 [ %277, %266 ], [ 0, %224 ]
  %268 = phi i64 [ %276, %266 ], [ 0, %224 ]
  %269 = zext i32 %267 to i64
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 %269
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !11
  %272 = zext i8 %271 to i64
  %273 = shl i32 %267, 3
  %274 = zext i32 %273 to i64
  %275 = shl nuw i64 %272, %274
  %276 = or i64 %275, %268
  %277 = add nuw nsw i32 %267, 1
  %278 = icmp eq i32 %277, %221
  br i1 %278, label %279, label %266

279:                                              ; preds = %266, %226, %224
  %280 = phi i8 addrspace(4)* [ %265, %226 ], [ %220, %224 ], [ %220, %266 ]
  %281 = phi i32 [ %264, %226 ], [ 0, %224 ], [ 0, %266 ]
  %282 = phi i64 [ %263, %226 ], [ 0, %224 ], [ %276, %266 ]
  %283 = icmp ugt i32 %281, 7
  br i1 %283, label %286, label %284

284:                                              ; preds = %279
  %285 = icmp eq i32 %281, 0
  br i1 %285, label %339, label %326

286:                                              ; preds = %279
  %287 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !11
  %288 = zext i8 %287 to i64
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 1
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !11
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 8
  %293 = or i64 %292, %288
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 2
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !11
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 16
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 3
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !11
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 24
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 4
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !11
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 32
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 5
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !11
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 40
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 6
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !11
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 48
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 7
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !11
  %321 = zext i8 %320 to i64
  %322 = shl nuw i64 %321, 56
  %323 = or i64 %318, %322
  %324 = add nsw i32 %281, -8
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 8
  br label %339

326:                                              ; preds = %284, %326
  %327 = phi i32 [ %337, %326 ], [ 0, %284 ]
  %328 = phi i64 [ %336, %326 ], [ 0, %284 ]
  %329 = zext i32 %327 to i64
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 %329
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !11
  %332 = zext i8 %331 to i64
  %333 = shl i32 %327, 3
  %334 = zext i32 %333 to i64
  %335 = shl nuw i64 %332, %334
  %336 = or i64 %335, %328
  %337 = add nuw nsw i32 %327, 1
  %338 = icmp eq i32 %337, %281
  br i1 %338, label %339, label %326

339:                                              ; preds = %326, %286, %284
  %340 = phi i8 addrspace(4)* [ %325, %286 ], [ %280, %284 ], [ %280, %326 ]
  %341 = phi i32 [ %324, %286 ], [ 0, %284 ], [ 0, %326 ]
  %342 = phi i64 [ %323, %286 ], [ 0, %284 ], [ %336, %326 ]
  %343 = icmp ugt i32 %341, 7
  br i1 %343, label %346, label %344

344:                                              ; preds = %339
  %345 = icmp eq i32 %341, 0
  br i1 %345, label %399, label %386

346:                                              ; preds = %339
  %347 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !11
  %348 = zext i8 %347 to i64
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 1
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !11
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 8
  %353 = or i64 %352, %348
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 2
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !11
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 16
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 3
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !11
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 24
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 4
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !11
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 32
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 5
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !11
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 40
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 6
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !11
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 48
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 7
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !11
  %381 = zext i8 %380 to i64
  %382 = shl nuw i64 %381, 56
  %383 = or i64 %378, %382
  %384 = add nsw i32 %341, -8
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 8
  br label %399

386:                                              ; preds = %344, %386
  %387 = phi i32 [ %397, %386 ], [ 0, %344 ]
  %388 = phi i64 [ %396, %386 ], [ 0, %344 ]
  %389 = zext i32 %387 to i64
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 %389
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !11
  %392 = zext i8 %391 to i64
  %393 = shl i32 %387, 3
  %394 = zext i32 %393 to i64
  %395 = shl nuw i64 %392, %394
  %396 = or i64 %395, %388
  %397 = add nuw nsw i32 %387, 1
  %398 = icmp eq i32 %397, %341
  br i1 %398, label %399, label %386

399:                                              ; preds = %386, %346, %344
  %400 = phi i8 addrspace(4)* [ %385, %346 ], [ %340, %344 ], [ %340, %386 ]
  %401 = phi i32 [ %384, %346 ], [ 0, %344 ], [ 0, %386 ]
  %402 = phi i64 [ %383, %346 ], [ 0, %344 ], [ %396, %386 ]
  %403 = icmp ugt i32 %401, 7
  br i1 %403, label %406, label %404

404:                                              ; preds = %399
  %405 = icmp eq i32 %401, 0
  br i1 %405, label %457, label %444

406:                                              ; preds = %399
  %407 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !11
  %408 = zext i8 %407 to i64
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 1
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !11
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 8
  %413 = or i64 %412, %408
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 2
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !11
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 16
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 3
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !11
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 24
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 4
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !11
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 32
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 5
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !11
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 40
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 6
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !11
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 48
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 7
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !11
  %441 = zext i8 %440 to i64
  %442 = shl nuw i64 %441, 56
  %443 = or i64 %438, %442
  br label %457

444:                                              ; preds = %404, %444
  %445 = phi i32 [ %455, %444 ], [ 0, %404 ]
  %446 = phi i64 [ %454, %444 ], [ 0, %404 ]
  %447 = zext i32 %445 to i64
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 %447
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !11
  %450 = zext i8 %449 to i64
  %451 = shl i32 %445, 3
  %452 = zext i32 %451 to i64
  %453 = shl nuw i64 %450, %452
  %454 = or i64 %453, %446
  %455 = add nuw nsw i32 %445, 1
  %456 = icmp eq i32 %455, %401
  br i1 %456, label %457, label %444

457:                                              ; preds = %444, %406, %404
  %458 = phi i64 [ %443, %406 ], [ 0, %404 ], [ %454, %444 ]
  %459 = shl nuw nsw i64 %40, 2
  %460 = add nuw nsw i64 %459, 28
  %461 = and i64 %460, 480
  %462 = and i64 %42, -225
  %463 = or i64 %462, %461
  %464 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %463, i64 noundef %102, i64 noundef %162, i64 noundef %222, i64 noundef %282, i64 noundef %342, i64 noundef %402, i64 noundef %458) #12
  %465 = sub i64 %32, %40
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 %40
  %467 = icmp eq i64 %465, 0
  br i1 %467, label %468, label %31

468:                                              ; preds = %457, %23
  %469 = phi <2 x i64> [ %26, %23 ], [ %464, %457 ]
  %470 = extractelement <2 x i64> %469, i64 0
  %471 = zext i32 %13 to i64
  %472 = and i64 %470, -225
  %473 = or i64 %472, 32
  %474 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %473, i64 noundef %471, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %475 = extractelement <2 x i64> %474, i64 0
  %476 = zext i32 %14 to i64
  %477 = and i64 %475, -227
  %478 = or i64 %477, 34
  %479 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %478, i64 noundef %476, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %480 = sext i32 %2 to i64
  %481 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %480, i64 4)
  %482 = extractvalue { i64, i1 } %481, 1
  %483 = extractvalue { i64, i1 } %481, 0
  %484 = tail call i64 @llvm.umax.i64(i64 %483, i64 1)
  %485 = select i1 %482, i64 -1, i64 %484
  %486 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %485) #12
  %487 = bitcast i8 addrspace(1)* %486 to i32 addrspace(1)*
  %488 = icmp eq i32 %2, 0
  br i1 %488, label %500, label %489

489:                                              ; preds = %468
  %490 = shl nsw i64 %480, 2
  br label %491

491:                                              ; preds = %489, %491
  %492 = phi i8 addrspace(1)* [ %498, %491 ], [ %486, %489 ]
  %493 = phi i64 [ %497, %491 ], [ %490, %489 ]
  store i8 0, i8 addrspace(1)* %492, align 1, !tbaa !14
  %494 = getelementptr inbounds i8, i8 addrspace(1)* %492, i64 1
  store i8 0, i8 addrspace(1)* %494, align 1, !tbaa !14
  %495 = getelementptr inbounds i8, i8 addrspace(1)* %492, i64 2
  store i8 0, i8 addrspace(1)* %495, align 1, !tbaa !14
  %496 = getelementptr inbounds i8, i8 addrspace(1)* %492, i64 3
  store i8 0, i8 addrspace(1)* %496, align 1, !tbaa !14
  %497 = add i64 %493, -4
  %498 = getelementptr inbounds i8, i8 addrspace(1)* %492, i64 4
  %499 = icmp eq i64 %497, 0
  br i1 %499, label %500, label %491, !llvm.loop !17

500:                                              ; preds = %491, %468
  %501 = icmp slt i32 %12, %2
  br i1 %501, label %502, label %1466

502:                                              ; preds = %500
  %503 = icmp sgt i32 %2, 0
  br i1 %503, label %504, label %1466

504:                                              ; preds = %502
  %505 = mul nsw i32 %12, %2
  br label %507

506:                                              ; preds = %986
  br i1 %503, label %988, label %1466

507:                                              ; preds = %504, %986
  %508 = phi i32 [ 0, %504 ], [ %509, %986 ]
  %509 = add nuw nsw i32 %508, 1
  %510 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %511 = extractelement <2 x i64> %510, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([43 x i8], [43 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %512, label %516

512:                                              ; preds = %507
  %513 = and i64 %511, -225
  %514 = or i64 %513, 32
  %515 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %514, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %957

516:                                              ; preds = %507
  %517 = and i64 %511, 2
  %518 = and i64 %511, -3
  %519 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %518, i64 0
  br label %520

520:                                              ; preds = %946, %516
  %521 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([43 x i8], [43 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([43 x i8], [43 x i8] addrspace(4)* @.str.1, i64 0, i64 42) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([43 x i8]* addrspacecast ([43 x i8] addrspace(4)* @.str.1 to [43 x i8]*) to i64)), i64 1))), %516 ], [ %954, %946 ]
  %522 = phi i8 addrspace(4)* [ getelementptr inbounds ([43 x i8], [43 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %516 ], [ %955, %946 ]
  %523 = phi <2 x i64> [ %519, %516 ], [ %953, %946 ]
  %524 = icmp ugt i64 %521, 56
  %525 = extractelement <2 x i64> %523, i64 0
  %526 = or i64 %525, %517
  %527 = insertelement <2 x i64> poison, i64 %526, i64 0
  %528 = select i1 %524, <2 x i64> %523, <2 x i64> %527
  %529 = tail call i64 @llvm.umin.i64(i64 %521, i64 56)
  %530 = trunc i64 %529 to i32
  %531 = extractelement <2 x i64> %528, i64 0
  %532 = icmp ugt i32 %530, 7
  br i1 %532, label %535, label %533

533:                                              ; preds = %520
  %534 = icmp eq i32 %530, 0
  br i1 %534, label %588, label %575

535:                                              ; preds = %520
  %536 = load i8, i8 addrspace(4)* %522, align 1, !tbaa !11
  %537 = zext i8 %536 to i64
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 1
  %539 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !11
  %540 = zext i8 %539 to i64
  %541 = shl nuw nsw i64 %540, 8
  %542 = or i64 %541, %537
  %543 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 2
  %544 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !11
  %545 = zext i8 %544 to i64
  %546 = shl nuw nsw i64 %545, 16
  %547 = or i64 %542, %546
  %548 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 3
  %549 = load i8, i8 addrspace(4)* %548, align 1, !tbaa !11
  %550 = zext i8 %549 to i64
  %551 = shl nuw nsw i64 %550, 24
  %552 = or i64 %547, %551
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 4
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !11
  %555 = zext i8 %554 to i64
  %556 = shl nuw nsw i64 %555, 32
  %557 = or i64 %552, %556
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 5
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !11
  %560 = zext i8 %559 to i64
  %561 = shl nuw nsw i64 %560, 40
  %562 = or i64 %557, %561
  %563 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 6
  %564 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !11
  %565 = zext i8 %564 to i64
  %566 = shl nuw nsw i64 %565, 48
  %567 = or i64 %562, %566
  %568 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 7
  %569 = load i8, i8 addrspace(4)* %568, align 1, !tbaa !11
  %570 = zext i8 %569 to i64
  %571 = shl nuw i64 %570, 56
  %572 = or i64 %567, %571
  %573 = add nsw i32 %530, -8
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 8
  br label %588

575:                                              ; preds = %533, %575
  %576 = phi i32 [ %586, %575 ], [ 0, %533 ]
  %577 = phi i64 [ %585, %575 ], [ 0, %533 ]
  %578 = zext i32 %576 to i64
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 %578
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !11
  %581 = zext i8 %580 to i64
  %582 = shl i32 %576, 3
  %583 = zext i32 %582 to i64
  %584 = shl nuw i64 %581, %583
  %585 = or i64 %584, %577
  %586 = add nuw nsw i32 %576, 1
  %587 = icmp eq i32 %586, %530
  br i1 %587, label %588, label %575, !llvm.loop !12

588:                                              ; preds = %575, %535, %533
  %589 = phi i8 addrspace(4)* [ %574, %535 ], [ %522, %533 ], [ %522, %575 ]
  %590 = phi i32 [ %573, %535 ], [ 0, %533 ], [ 0, %575 ]
  %591 = phi i64 [ %572, %535 ], [ 0, %533 ], [ %585, %575 ]
  %592 = icmp ugt i32 %590, 7
  br i1 %592, label %595, label %593

593:                                              ; preds = %588
  %594 = icmp eq i32 %590, 0
  br i1 %594, label %648, label %635

595:                                              ; preds = %588
  %596 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !11
  %597 = zext i8 %596 to i64
  %598 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 1
  %599 = load i8, i8 addrspace(4)* %598, align 1, !tbaa !11
  %600 = zext i8 %599 to i64
  %601 = shl nuw nsw i64 %600, 8
  %602 = or i64 %601, %597
  %603 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 2
  %604 = load i8, i8 addrspace(4)* %603, align 1, !tbaa !11
  %605 = zext i8 %604 to i64
  %606 = shl nuw nsw i64 %605, 16
  %607 = or i64 %602, %606
  %608 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 3
  %609 = load i8, i8 addrspace(4)* %608, align 1, !tbaa !11
  %610 = zext i8 %609 to i64
  %611 = shl nuw nsw i64 %610, 24
  %612 = or i64 %607, %611
  %613 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 4
  %614 = load i8, i8 addrspace(4)* %613, align 1, !tbaa !11
  %615 = zext i8 %614 to i64
  %616 = shl nuw nsw i64 %615, 32
  %617 = or i64 %612, %616
  %618 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 5
  %619 = load i8, i8 addrspace(4)* %618, align 1, !tbaa !11
  %620 = zext i8 %619 to i64
  %621 = shl nuw nsw i64 %620, 40
  %622 = or i64 %617, %621
  %623 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 6
  %624 = load i8, i8 addrspace(4)* %623, align 1, !tbaa !11
  %625 = zext i8 %624 to i64
  %626 = shl nuw nsw i64 %625, 48
  %627 = or i64 %622, %626
  %628 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 7
  %629 = load i8, i8 addrspace(4)* %628, align 1, !tbaa !11
  %630 = zext i8 %629 to i64
  %631 = shl nuw i64 %630, 56
  %632 = or i64 %627, %631
  %633 = add nsw i32 %590, -8
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 8
  br label %648

635:                                              ; preds = %593, %635
  %636 = phi i32 [ %646, %635 ], [ 0, %593 ]
  %637 = phi i64 [ %645, %635 ], [ 0, %593 ]
  %638 = zext i32 %636 to i64
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 %638
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !11
  %641 = zext i8 %640 to i64
  %642 = shl i32 %636, 3
  %643 = zext i32 %642 to i64
  %644 = shl nuw i64 %641, %643
  %645 = or i64 %644, %637
  %646 = add nuw nsw i32 %636, 1
  %647 = icmp eq i32 %646, %590
  br i1 %647, label %648, label %635

648:                                              ; preds = %635, %595, %593
  %649 = phi i8 addrspace(4)* [ %634, %595 ], [ %589, %593 ], [ %589, %635 ]
  %650 = phi i32 [ %633, %595 ], [ 0, %593 ], [ 0, %635 ]
  %651 = phi i64 [ %632, %595 ], [ 0, %593 ], [ %645, %635 ]
  %652 = icmp ugt i32 %650, 7
  br i1 %652, label %655, label %653

653:                                              ; preds = %648
  %654 = icmp eq i32 %650, 0
  br i1 %654, label %708, label %695

655:                                              ; preds = %648
  %656 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !11
  %657 = zext i8 %656 to i64
  %658 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 1
  %659 = load i8, i8 addrspace(4)* %658, align 1, !tbaa !11
  %660 = zext i8 %659 to i64
  %661 = shl nuw nsw i64 %660, 8
  %662 = or i64 %661, %657
  %663 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 2
  %664 = load i8, i8 addrspace(4)* %663, align 1, !tbaa !11
  %665 = zext i8 %664 to i64
  %666 = shl nuw nsw i64 %665, 16
  %667 = or i64 %662, %666
  %668 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 3
  %669 = load i8, i8 addrspace(4)* %668, align 1, !tbaa !11
  %670 = zext i8 %669 to i64
  %671 = shl nuw nsw i64 %670, 24
  %672 = or i64 %667, %671
  %673 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 4
  %674 = load i8, i8 addrspace(4)* %673, align 1, !tbaa !11
  %675 = zext i8 %674 to i64
  %676 = shl nuw nsw i64 %675, 32
  %677 = or i64 %672, %676
  %678 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 5
  %679 = load i8, i8 addrspace(4)* %678, align 1, !tbaa !11
  %680 = zext i8 %679 to i64
  %681 = shl nuw nsw i64 %680, 40
  %682 = or i64 %677, %681
  %683 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 6
  %684 = load i8, i8 addrspace(4)* %683, align 1, !tbaa !11
  %685 = zext i8 %684 to i64
  %686 = shl nuw nsw i64 %685, 48
  %687 = or i64 %682, %686
  %688 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 7
  %689 = load i8, i8 addrspace(4)* %688, align 1, !tbaa !11
  %690 = zext i8 %689 to i64
  %691 = shl nuw i64 %690, 56
  %692 = or i64 %687, %691
  %693 = add nsw i32 %650, -8
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 8
  br label %708

695:                                              ; preds = %653, %695
  %696 = phi i32 [ %706, %695 ], [ 0, %653 ]
  %697 = phi i64 [ %705, %695 ], [ 0, %653 ]
  %698 = zext i32 %696 to i64
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 %698
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !11
  %701 = zext i8 %700 to i64
  %702 = shl i32 %696, 3
  %703 = zext i32 %702 to i64
  %704 = shl nuw i64 %701, %703
  %705 = or i64 %704, %697
  %706 = add nuw nsw i32 %696, 1
  %707 = icmp eq i32 %706, %650
  br i1 %707, label %708, label %695

708:                                              ; preds = %695, %655, %653
  %709 = phi i8 addrspace(4)* [ %694, %655 ], [ %649, %653 ], [ %649, %695 ]
  %710 = phi i32 [ %693, %655 ], [ 0, %653 ], [ 0, %695 ]
  %711 = phi i64 [ %692, %655 ], [ 0, %653 ], [ %705, %695 ]
  %712 = icmp ugt i32 %710, 7
  br i1 %712, label %715, label %713

713:                                              ; preds = %708
  %714 = icmp eq i32 %710, 0
  br i1 %714, label %768, label %755

715:                                              ; preds = %708
  %716 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !11
  %717 = zext i8 %716 to i64
  %718 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 1
  %719 = load i8, i8 addrspace(4)* %718, align 1, !tbaa !11
  %720 = zext i8 %719 to i64
  %721 = shl nuw nsw i64 %720, 8
  %722 = or i64 %721, %717
  %723 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 2
  %724 = load i8, i8 addrspace(4)* %723, align 1, !tbaa !11
  %725 = zext i8 %724 to i64
  %726 = shl nuw nsw i64 %725, 16
  %727 = or i64 %722, %726
  %728 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 3
  %729 = load i8, i8 addrspace(4)* %728, align 1, !tbaa !11
  %730 = zext i8 %729 to i64
  %731 = shl nuw nsw i64 %730, 24
  %732 = or i64 %727, %731
  %733 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 4
  %734 = load i8, i8 addrspace(4)* %733, align 1, !tbaa !11
  %735 = zext i8 %734 to i64
  %736 = shl nuw nsw i64 %735, 32
  %737 = or i64 %732, %736
  %738 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 5
  %739 = load i8, i8 addrspace(4)* %738, align 1, !tbaa !11
  %740 = zext i8 %739 to i64
  %741 = shl nuw nsw i64 %740, 40
  %742 = or i64 %737, %741
  %743 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 6
  %744 = load i8, i8 addrspace(4)* %743, align 1, !tbaa !11
  %745 = zext i8 %744 to i64
  %746 = shl nuw nsw i64 %745, 48
  %747 = or i64 %742, %746
  %748 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 7
  %749 = load i8, i8 addrspace(4)* %748, align 1, !tbaa !11
  %750 = zext i8 %749 to i64
  %751 = shl nuw i64 %750, 56
  %752 = or i64 %747, %751
  %753 = add nsw i32 %710, -8
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 8
  br label %768

755:                                              ; preds = %713, %755
  %756 = phi i32 [ %766, %755 ], [ 0, %713 ]
  %757 = phi i64 [ %765, %755 ], [ 0, %713 ]
  %758 = zext i32 %756 to i64
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 %758
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !11
  %761 = zext i8 %760 to i64
  %762 = shl i32 %756, 3
  %763 = zext i32 %762 to i64
  %764 = shl nuw i64 %761, %763
  %765 = or i64 %764, %757
  %766 = add nuw nsw i32 %756, 1
  %767 = icmp eq i32 %766, %710
  br i1 %767, label %768, label %755

768:                                              ; preds = %755, %715, %713
  %769 = phi i8 addrspace(4)* [ %754, %715 ], [ %709, %713 ], [ %709, %755 ]
  %770 = phi i32 [ %753, %715 ], [ 0, %713 ], [ 0, %755 ]
  %771 = phi i64 [ %752, %715 ], [ 0, %713 ], [ %765, %755 ]
  %772 = icmp ugt i32 %770, 7
  br i1 %772, label %775, label %773

773:                                              ; preds = %768
  %774 = icmp eq i32 %770, 0
  br i1 %774, label %828, label %815

775:                                              ; preds = %768
  %776 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !11
  %777 = zext i8 %776 to i64
  %778 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 1
  %779 = load i8, i8 addrspace(4)* %778, align 1, !tbaa !11
  %780 = zext i8 %779 to i64
  %781 = shl nuw nsw i64 %780, 8
  %782 = or i64 %781, %777
  %783 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 2
  %784 = load i8, i8 addrspace(4)* %783, align 1, !tbaa !11
  %785 = zext i8 %784 to i64
  %786 = shl nuw nsw i64 %785, 16
  %787 = or i64 %782, %786
  %788 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 3
  %789 = load i8, i8 addrspace(4)* %788, align 1, !tbaa !11
  %790 = zext i8 %789 to i64
  %791 = shl nuw nsw i64 %790, 24
  %792 = or i64 %787, %791
  %793 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 4
  %794 = load i8, i8 addrspace(4)* %793, align 1, !tbaa !11
  %795 = zext i8 %794 to i64
  %796 = shl nuw nsw i64 %795, 32
  %797 = or i64 %792, %796
  %798 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 5
  %799 = load i8, i8 addrspace(4)* %798, align 1, !tbaa !11
  %800 = zext i8 %799 to i64
  %801 = shl nuw nsw i64 %800, 40
  %802 = or i64 %797, %801
  %803 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 6
  %804 = load i8, i8 addrspace(4)* %803, align 1, !tbaa !11
  %805 = zext i8 %804 to i64
  %806 = shl nuw nsw i64 %805, 48
  %807 = or i64 %802, %806
  %808 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 7
  %809 = load i8, i8 addrspace(4)* %808, align 1, !tbaa !11
  %810 = zext i8 %809 to i64
  %811 = shl nuw i64 %810, 56
  %812 = or i64 %807, %811
  %813 = add nsw i32 %770, -8
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 8
  br label %828

815:                                              ; preds = %773, %815
  %816 = phi i32 [ %826, %815 ], [ 0, %773 ]
  %817 = phi i64 [ %825, %815 ], [ 0, %773 ]
  %818 = zext i32 %816 to i64
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 %818
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !11
  %821 = zext i8 %820 to i64
  %822 = shl i32 %816, 3
  %823 = zext i32 %822 to i64
  %824 = shl nuw i64 %821, %823
  %825 = or i64 %824, %817
  %826 = add nuw nsw i32 %816, 1
  %827 = icmp eq i32 %826, %770
  br i1 %827, label %828, label %815

828:                                              ; preds = %815, %775, %773
  %829 = phi i8 addrspace(4)* [ %814, %775 ], [ %769, %773 ], [ %769, %815 ]
  %830 = phi i32 [ %813, %775 ], [ 0, %773 ], [ 0, %815 ]
  %831 = phi i64 [ %812, %775 ], [ 0, %773 ], [ %825, %815 ]
  %832 = icmp ugt i32 %830, 7
  br i1 %832, label %835, label %833

833:                                              ; preds = %828
  %834 = icmp eq i32 %830, 0
  br i1 %834, label %888, label %875

835:                                              ; preds = %828
  %836 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !11
  %837 = zext i8 %836 to i64
  %838 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 1
  %839 = load i8, i8 addrspace(4)* %838, align 1, !tbaa !11
  %840 = zext i8 %839 to i64
  %841 = shl nuw nsw i64 %840, 8
  %842 = or i64 %841, %837
  %843 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 2
  %844 = load i8, i8 addrspace(4)* %843, align 1, !tbaa !11
  %845 = zext i8 %844 to i64
  %846 = shl nuw nsw i64 %845, 16
  %847 = or i64 %842, %846
  %848 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 3
  %849 = load i8, i8 addrspace(4)* %848, align 1, !tbaa !11
  %850 = zext i8 %849 to i64
  %851 = shl nuw nsw i64 %850, 24
  %852 = or i64 %847, %851
  %853 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 4
  %854 = load i8, i8 addrspace(4)* %853, align 1, !tbaa !11
  %855 = zext i8 %854 to i64
  %856 = shl nuw nsw i64 %855, 32
  %857 = or i64 %852, %856
  %858 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 5
  %859 = load i8, i8 addrspace(4)* %858, align 1, !tbaa !11
  %860 = zext i8 %859 to i64
  %861 = shl nuw nsw i64 %860, 40
  %862 = or i64 %857, %861
  %863 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 6
  %864 = load i8, i8 addrspace(4)* %863, align 1, !tbaa !11
  %865 = zext i8 %864 to i64
  %866 = shl nuw nsw i64 %865, 48
  %867 = or i64 %862, %866
  %868 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 7
  %869 = load i8, i8 addrspace(4)* %868, align 1, !tbaa !11
  %870 = zext i8 %869 to i64
  %871 = shl nuw i64 %870, 56
  %872 = or i64 %867, %871
  %873 = add nsw i32 %830, -8
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 8
  br label %888

875:                                              ; preds = %833, %875
  %876 = phi i32 [ %886, %875 ], [ 0, %833 ]
  %877 = phi i64 [ %885, %875 ], [ 0, %833 ]
  %878 = zext i32 %876 to i64
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 %878
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !11
  %881 = zext i8 %880 to i64
  %882 = shl i32 %876, 3
  %883 = zext i32 %882 to i64
  %884 = shl nuw i64 %881, %883
  %885 = or i64 %884, %877
  %886 = add nuw nsw i32 %876, 1
  %887 = icmp eq i32 %886, %830
  br i1 %887, label %888, label %875

888:                                              ; preds = %875, %835, %833
  %889 = phi i8 addrspace(4)* [ %874, %835 ], [ %829, %833 ], [ %829, %875 ]
  %890 = phi i32 [ %873, %835 ], [ 0, %833 ], [ 0, %875 ]
  %891 = phi i64 [ %872, %835 ], [ 0, %833 ], [ %885, %875 ]
  %892 = icmp ugt i32 %890, 7
  br i1 %892, label %895, label %893

893:                                              ; preds = %888
  %894 = icmp eq i32 %890, 0
  br i1 %894, label %946, label %933

895:                                              ; preds = %888
  %896 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !11
  %897 = zext i8 %896 to i64
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 1
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !11
  %900 = zext i8 %899 to i64
  %901 = shl nuw nsw i64 %900, 8
  %902 = or i64 %901, %897
  %903 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 2
  %904 = load i8, i8 addrspace(4)* %903, align 1, !tbaa !11
  %905 = zext i8 %904 to i64
  %906 = shl nuw nsw i64 %905, 16
  %907 = or i64 %902, %906
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 3
  %909 = load i8, i8 addrspace(4)* %908, align 1, !tbaa !11
  %910 = zext i8 %909 to i64
  %911 = shl nuw nsw i64 %910, 24
  %912 = or i64 %907, %911
  %913 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 4
  %914 = load i8, i8 addrspace(4)* %913, align 1, !tbaa !11
  %915 = zext i8 %914 to i64
  %916 = shl nuw nsw i64 %915, 32
  %917 = or i64 %912, %916
  %918 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 5
  %919 = load i8, i8 addrspace(4)* %918, align 1, !tbaa !11
  %920 = zext i8 %919 to i64
  %921 = shl nuw nsw i64 %920, 40
  %922 = or i64 %917, %921
  %923 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 6
  %924 = load i8, i8 addrspace(4)* %923, align 1, !tbaa !11
  %925 = zext i8 %924 to i64
  %926 = shl nuw nsw i64 %925, 48
  %927 = or i64 %922, %926
  %928 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 7
  %929 = load i8, i8 addrspace(4)* %928, align 1, !tbaa !11
  %930 = zext i8 %929 to i64
  %931 = shl nuw i64 %930, 56
  %932 = or i64 %927, %931
  br label %946

933:                                              ; preds = %893, %933
  %934 = phi i32 [ %944, %933 ], [ 0, %893 ]
  %935 = phi i64 [ %943, %933 ], [ 0, %893 ]
  %936 = zext i32 %934 to i64
  %937 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 %936
  %938 = load i8, i8 addrspace(4)* %937, align 1, !tbaa !11
  %939 = zext i8 %938 to i64
  %940 = shl i32 %934, 3
  %941 = zext i32 %940 to i64
  %942 = shl nuw i64 %939, %941
  %943 = or i64 %942, %935
  %944 = add nuw nsw i32 %934, 1
  %945 = icmp eq i32 %944, %890
  br i1 %945, label %946, label %933

946:                                              ; preds = %933, %895, %893
  %947 = phi i64 [ %932, %895 ], [ 0, %893 ], [ %943, %933 ]
  %948 = shl nuw nsw i64 %529, 2
  %949 = add nuw nsw i64 %948, 28
  %950 = and i64 %949, 480
  %951 = and i64 %531, -225
  %952 = or i64 %951, %950
  %953 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %952, i64 noundef %591, i64 noundef %651, i64 noundef %711, i64 noundef %771, i64 noundef %831, i64 noundef %891, i64 noundef %947) #12
  %954 = sub i64 %521, %529
  %955 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 %529
  %956 = icmp eq i64 %954, 0
  br i1 %956, label %957, label %520

957:                                              ; preds = %946, %512
  %958 = phi <2 x i64> [ %515, %512 ], [ %953, %946 ]
  %959 = extractelement <2 x i64> %958, i64 0
  %960 = and i64 %959, -225
  %961 = or i64 %960, 32
  %962 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %961, i64 noundef %471, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %963 = extractelement <2 x i64> %962, i64 0
  %964 = and i64 %963, -225
  %965 = or i64 %964, 32
  %966 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %965, i64 noundef %476, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %967 = extractelement <2 x i64> %966, i64 0
  %968 = zext i32 %509 to i64
  %969 = and i64 %967, -227
  %970 = or i64 %969, 34
  %971 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %970, i64 noundef %968, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %972 = add nsw i32 %508, %505
  %973 = sext i32 %972 to i64
  %974 = getelementptr inbounds float, float addrspace(1)* %0, i64 %973
  %975 = load float, float addrspace(1)* %974, align 4, !tbaa !19
  %976 = fcmp contract oeq float %975, 1.000000e+00
  br i1 %976, label %977, label %986

977:                                              ; preds = %957
  %978 = zext i32 %508 to i64
  %979 = getelementptr inbounds float, float addrspace(1)* %1, i64 %978
  %980 = load float, float addrspace(1)* %979, align 4, !tbaa !19
  %981 = fcmp contract une float %980, -1.000000e+00
  br i1 %981, label %982, label %986

982:                                              ; preds = %977
  %983 = fptosi float %980 to i32
  %984 = sext i32 %983 to i64
  %985 = getelementptr inbounds i32, i32 addrspace(1)* %487, i64 %984
  store i32 1, i32 addrspace(1)* %985, align 4, !tbaa !21
  br label %986

986:                                              ; preds = %957, %977, %982
  %987 = icmp eq i32 %509, %2
  br i1 %987, label %506, label %507, !llvm.loop !23

988:                                              ; preds = %506, %1464
  %989 = phi i32 [ %994, %1464 ], [ 0, %506 ]
  %990 = zext i32 %989 to i64
  %991 = getelementptr inbounds i32, i32 addrspace(1)* %487, i64 %990
  %992 = load i32, i32 addrspace(1)* %991, align 4, !tbaa !21
  %993 = icmp eq i32 %992, 0
  %994 = add nuw nsw i32 %989, 1
  br i1 %993, label %995, label %1464

995:                                              ; preds = %988
  %996 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %997 = extractelement <2 x i64> %996, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %998, label %1002

998:                                              ; preds = %995
  %999 = and i64 %997, -225
  %1000 = or i64 %999, 32
  %1001 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %1000, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %1443

1002:                                             ; preds = %995
  %1003 = and i64 %997, 2
  %1004 = and i64 %997, -3
  %1005 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1004, i64 0
  br label %1006

1006:                                             ; preds = %1432, %1002
  %1007 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str.2, i64 0, i64 43) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([44 x i8]* addrspacecast ([44 x i8] addrspace(4)* @.str.2 to [44 x i8]*) to i64)), i64 1))), %1002 ], [ %1440, %1432 ]
  %1008 = phi i8 addrspace(4)* [ getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1002 ], [ %1441, %1432 ]
  %1009 = phi <2 x i64> [ %1005, %1002 ], [ %1439, %1432 ]
  %1010 = icmp ugt i64 %1007, 56
  %1011 = extractelement <2 x i64> %1009, i64 0
  %1012 = or i64 %1011, %1003
  %1013 = insertelement <2 x i64> poison, i64 %1012, i64 0
  %1014 = select i1 %1010, <2 x i64> %1009, <2 x i64> %1013
  %1015 = tail call i64 @llvm.umin.i64(i64 %1007, i64 56)
  %1016 = trunc i64 %1015 to i32
  %1017 = extractelement <2 x i64> %1014, i64 0
  %1018 = icmp ugt i32 %1016, 7
  br i1 %1018, label %1021, label %1019

1019:                                             ; preds = %1006
  %1020 = icmp eq i32 %1016, 0
  br i1 %1020, label %1074, label %1061

1021:                                             ; preds = %1006
  %1022 = load i8, i8 addrspace(4)* %1008, align 1, !tbaa !11
  %1023 = zext i8 %1022 to i64
  %1024 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 1
  %1025 = load i8, i8 addrspace(4)* %1024, align 1, !tbaa !11
  %1026 = zext i8 %1025 to i64
  %1027 = shl nuw nsw i64 %1026, 8
  %1028 = or i64 %1027, %1023
  %1029 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 2
  %1030 = load i8, i8 addrspace(4)* %1029, align 1, !tbaa !11
  %1031 = zext i8 %1030 to i64
  %1032 = shl nuw nsw i64 %1031, 16
  %1033 = or i64 %1028, %1032
  %1034 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 3
  %1035 = load i8, i8 addrspace(4)* %1034, align 1, !tbaa !11
  %1036 = zext i8 %1035 to i64
  %1037 = shl nuw nsw i64 %1036, 24
  %1038 = or i64 %1033, %1037
  %1039 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 4
  %1040 = load i8, i8 addrspace(4)* %1039, align 1, !tbaa !11
  %1041 = zext i8 %1040 to i64
  %1042 = shl nuw nsw i64 %1041, 32
  %1043 = or i64 %1038, %1042
  %1044 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 5
  %1045 = load i8, i8 addrspace(4)* %1044, align 1, !tbaa !11
  %1046 = zext i8 %1045 to i64
  %1047 = shl nuw nsw i64 %1046, 40
  %1048 = or i64 %1043, %1047
  %1049 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 6
  %1050 = load i8, i8 addrspace(4)* %1049, align 1, !tbaa !11
  %1051 = zext i8 %1050 to i64
  %1052 = shl nuw nsw i64 %1051, 48
  %1053 = or i64 %1048, %1052
  %1054 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 7
  %1055 = load i8, i8 addrspace(4)* %1054, align 1, !tbaa !11
  %1056 = zext i8 %1055 to i64
  %1057 = shl nuw i64 %1056, 56
  %1058 = or i64 %1053, %1057
  %1059 = add nsw i32 %1016, -8
  %1060 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 8
  br label %1074

1061:                                             ; preds = %1019, %1061
  %1062 = phi i32 [ %1072, %1061 ], [ 0, %1019 ]
  %1063 = phi i64 [ %1071, %1061 ], [ 0, %1019 ]
  %1064 = zext i32 %1062 to i64
  %1065 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 %1064
  %1066 = load i8, i8 addrspace(4)* %1065, align 1, !tbaa !11
  %1067 = zext i8 %1066 to i64
  %1068 = shl i32 %1062, 3
  %1069 = zext i32 %1068 to i64
  %1070 = shl nuw i64 %1067, %1069
  %1071 = or i64 %1070, %1063
  %1072 = add nuw nsw i32 %1062, 1
  %1073 = icmp eq i32 %1072, %1016
  br i1 %1073, label %1074, label %1061, !llvm.loop !12

1074:                                             ; preds = %1061, %1021, %1019
  %1075 = phi i8 addrspace(4)* [ %1060, %1021 ], [ %1008, %1019 ], [ %1008, %1061 ]
  %1076 = phi i32 [ %1059, %1021 ], [ 0, %1019 ], [ 0, %1061 ]
  %1077 = phi i64 [ %1058, %1021 ], [ 0, %1019 ], [ %1071, %1061 ]
  %1078 = icmp ugt i32 %1076, 7
  br i1 %1078, label %1081, label %1079

1079:                                             ; preds = %1074
  %1080 = icmp eq i32 %1076, 0
  br i1 %1080, label %1134, label %1121

1081:                                             ; preds = %1074
  %1082 = load i8, i8 addrspace(4)* %1075, align 1, !tbaa !11
  %1083 = zext i8 %1082 to i64
  %1084 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 1
  %1085 = load i8, i8 addrspace(4)* %1084, align 1, !tbaa !11
  %1086 = zext i8 %1085 to i64
  %1087 = shl nuw nsw i64 %1086, 8
  %1088 = or i64 %1087, %1083
  %1089 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 2
  %1090 = load i8, i8 addrspace(4)* %1089, align 1, !tbaa !11
  %1091 = zext i8 %1090 to i64
  %1092 = shl nuw nsw i64 %1091, 16
  %1093 = or i64 %1088, %1092
  %1094 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 3
  %1095 = load i8, i8 addrspace(4)* %1094, align 1, !tbaa !11
  %1096 = zext i8 %1095 to i64
  %1097 = shl nuw nsw i64 %1096, 24
  %1098 = or i64 %1093, %1097
  %1099 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 4
  %1100 = load i8, i8 addrspace(4)* %1099, align 1, !tbaa !11
  %1101 = zext i8 %1100 to i64
  %1102 = shl nuw nsw i64 %1101, 32
  %1103 = or i64 %1098, %1102
  %1104 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 5
  %1105 = load i8, i8 addrspace(4)* %1104, align 1, !tbaa !11
  %1106 = zext i8 %1105 to i64
  %1107 = shl nuw nsw i64 %1106, 40
  %1108 = or i64 %1103, %1107
  %1109 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 6
  %1110 = load i8, i8 addrspace(4)* %1109, align 1, !tbaa !11
  %1111 = zext i8 %1110 to i64
  %1112 = shl nuw nsw i64 %1111, 48
  %1113 = or i64 %1108, %1112
  %1114 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 7
  %1115 = load i8, i8 addrspace(4)* %1114, align 1, !tbaa !11
  %1116 = zext i8 %1115 to i64
  %1117 = shl nuw i64 %1116, 56
  %1118 = or i64 %1113, %1117
  %1119 = add nsw i32 %1076, -8
  %1120 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 8
  br label %1134

1121:                                             ; preds = %1079, %1121
  %1122 = phi i32 [ %1132, %1121 ], [ 0, %1079 ]
  %1123 = phi i64 [ %1131, %1121 ], [ 0, %1079 ]
  %1124 = zext i32 %1122 to i64
  %1125 = getelementptr inbounds i8, i8 addrspace(4)* %1075, i64 %1124
  %1126 = load i8, i8 addrspace(4)* %1125, align 1, !tbaa !11
  %1127 = zext i8 %1126 to i64
  %1128 = shl i32 %1122, 3
  %1129 = zext i32 %1128 to i64
  %1130 = shl nuw i64 %1127, %1129
  %1131 = or i64 %1130, %1123
  %1132 = add nuw nsw i32 %1122, 1
  %1133 = icmp eq i32 %1132, %1076
  br i1 %1133, label %1134, label %1121

1134:                                             ; preds = %1121, %1081, %1079
  %1135 = phi i8 addrspace(4)* [ %1120, %1081 ], [ %1075, %1079 ], [ %1075, %1121 ]
  %1136 = phi i32 [ %1119, %1081 ], [ 0, %1079 ], [ 0, %1121 ]
  %1137 = phi i64 [ %1118, %1081 ], [ 0, %1079 ], [ %1131, %1121 ]
  %1138 = icmp ugt i32 %1136, 7
  br i1 %1138, label %1141, label %1139

1139:                                             ; preds = %1134
  %1140 = icmp eq i32 %1136, 0
  br i1 %1140, label %1194, label %1181

1141:                                             ; preds = %1134
  %1142 = load i8, i8 addrspace(4)* %1135, align 1, !tbaa !11
  %1143 = zext i8 %1142 to i64
  %1144 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 1
  %1145 = load i8, i8 addrspace(4)* %1144, align 1, !tbaa !11
  %1146 = zext i8 %1145 to i64
  %1147 = shl nuw nsw i64 %1146, 8
  %1148 = or i64 %1147, %1143
  %1149 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 2
  %1150 = load i8, i8 addrspace(4)* %1149, align 1, !tbaa !11
  %1151 = zext i8 %1150 to i64
  %1152 = shl nuw nsw i64 %1151, 16
  %1153 = or i64 %1148, %1152
  %1154 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 3
  %1155 = load i8, i8 addrspace(4)* %1154, align 1, !tbaa !11
  %1156 = zext i8 %1155 to i64
  %1157 = shl nuw nsw i64 %1156, 24
  %1158 = or i64 %1153, %1157
  %1159 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 4
  %1160 = load i8, i8 addrspace(4)* %1159, align 1, !tbaa !11
  %1161 = zext i8 %1160 to i64
  %1162 = shl nuw nsw i64 %1161, 32
  %1163 = or i64 %1158, %1162
  %1164 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 5
  %1165 = load i8, i8 addrspace(4)* %1164, align 1, !tbaa !11
  %1166 = zext i8 %1165 to i64
  %1167 = shl nuw nsw i64 %1166, 40
  %1168 = or i64 %1163, %1167
  %1169 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 6
  %1170 = load i8, i8 addrspace(4)* %1169, align 1, !tbaa !11
  %1171 = zext i8 %1170 to i64
  %1172 = shl nuw nsw i64 %1171, 48
  %1173 = or i64 %1168, %1172
  %1174 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 7
  %1175 = load i8, i8 addrspace(4)* %1174, align 1, !tbaa !11
  %1176 = zext i8 %1175 to i64
  %1177 = shl nuw i64 %1176, 56
  %1178 = or i64 %1173, %1177
  %1179 = add nsw i32 %1136, -8
  %1180 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 8
  br label %1194

1181:                                             ; preds = %1139, %1181
  %1182 = phi i32 [ %1192, %1181 ], [ 0, %1139 ]
  %1183 = phi i64 [ %1191, %1181 ], [ 0, %1139 ]
  %1184 = zext i32 %1182 to i64
  %1185 = getelementptr inbounds i8, i8 addrspace(4)* %1135, i64 %1184
  %1186 = load i8, i8 addrspace(4)* %1185, align 1, !tbaa !11
  %1187 = zext i8 %1186 to i64
  %1188 = shl i32 %1182, 3
  %1189 = zext i32 %1188 to i64
  %1190 = shl nuw i64 %1187, %1189
  %1191 = or i64 %1190, %1183
  %1192 = add nuw nsw i32 %1182, 1
  %1193 = icmp eq i32 %1192, %1136
  br i1 %1193, label %1194, label %1181

1194:                                             ; preds = %1181, %1141, %1139
  %1195 = phi i8 addrspace(4)* [ %1180, %1141 ], [ %1135, %1139 ], [ %1135, %1181 ]
  %1196 = phi i32 [ %1179, %1141 ], [ 0, %1139 ], [ 0, %1181 ]
  %1197 = phi i64 [ %1178, %1141 ], [ 0, %1139 ], [ %1191, %1181 ]
  %1198 = icmp ugt i32 %1196, 7
  br i1 %1198, label %1201, label %1199

1199:                                             ; preds = %1194
  %1200 = icmp eq i32 %1196, 0
  br i1 %1200, label %1254, label %1241

1201:                                             ; preds = %1194
  %1202 = load i8, i8 addrspace(4)* %1195, align 1, !tbaa !11
  %1203 = zext i8 %1202 to i64
  %1204 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 1
  %1205 = load i8, i8 addrspace(4)* %1204, align 1, !tbaa !11
  %1206 = zext i8 %1205 to i64
  %1207 = shl nuw nsw i64 %1206, 8
  %1208 = or i64 %1207, %1203
  %1209 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 2
  %1210 = load i8, i8 addrspace(4)* %1209, align 1, !tbaa !11
  %1211 = zext i8 %1210 to i64
  %1212 = shl nuw nsw i64 %1211, 16
  %1213 = or i64 %1208, %1212
  %1214 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 3
  %1215 = load i8, i8 addrspace(4)* %1214, align 1, !tbaa !11
  %1216 = zext i8 %1215 to i64
  %1217 = shl nuw nsw i64 %1216, 24
  %1218 = or i64 %1213, %1217
  %1219 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 4
  %1220 = load i8, i8 addrspace(4)* %1219, align 1, !tbaa !11
  %1221 = zext i8 %1220 to i64
  %1222 = shl nuw nsw i64 %1221, 32
  %1223 = or i64 %1218, %1222
  %1224 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 5
  %1225 = load i8, i8 addrspace(4)* %1224, align 1, !tbaa !11
  %1226 = zext i8 %1225 to i64
  %1227 = shl nuw nsw i64 %1226, 40
  %1228 = or i64 %1223, %1227
  %1229 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 6
  %1230 = load i8, i8 addrspace(4)* %1229, align 1, !tbaa !11
  %1231 = zext i8 %1230 to i64
  %1232 = shl nuw nsw i64 %1231, 48
  %1233 = or i64 %1228, %1232
  %1234 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 7
  %1235 = load i8, i8 addrspace(4)* %1234, align 1, !tbaa !11
  %1236 = zext i8 %1235 to i64
  %1237 = shl nuw i64 %1236, 56
  %1238 = or i64 %1233, %1237
  %1239 = add nsw i32 %1196, -8
  %1240 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 8
  br label %1254

1241:                                             ; preds = %1199, %1241
  %1242 = phi i32 [ %1252, %1241 ], [ 0, %1199 ]
  %1243 = phi i64 [ %1251, %1241 ], [ 0, %1199 ]
  %1244 = zext i32 %1242 to i64
  %1245 = getelementptr inbounds i8, i8 addrspace(4)* %1195, i64 %1244
  %1246 = load i8, i8 addrspace(4)* %1245, align 1, !tbaa !11
  %1247 = zext i8 %1246 to i64
  %1248 = shl i32 %1242, 3
  %1249 = zext i32 %1248 to i64
  %1250 = shl nuw i64 %1247, %1249
  %1251 = or i64 %1250, %1243
  %1252 = add nuw nsw i32 %1242, 1
  %1253 = icmp eq i32 %1252, %1196
  br i1 %1253, label %1254, label %1241

1254:                                             ; preds = %1241, %1201, %1199
  %1255 = phi i8 addrspace(4)* [ %1240, %1201 ], [ %1195, %1199 ], [ %1195, %1241 ]
  %1256 = phi i32 [ %1239, %1201 ], [ 0, %1199 ], [ 0, %1241 ]
  %1257 = phi i64 [ %1238, %1201 ], [ 0, %1199 ], [ %1251, %1241 ]
  %1258 = icmp ugt i32 %1256, 7
  br i1 %1258, label %1261, label %1259

1259:                                             ; preds = %1254
  %1260 = icmp eq i32 %1256, 0
  br i1 %1260, label %1314, label %1301

1261:                                             ; preds = %1254
  %1262 = load i8, i8 addrspace(4)* %1255, align 1, !tbaa !11
  %1263 = zext i8 %1262 to i64
  %1264 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 1
  %1265 = load i8, i8 addrspace(4)* %1264, align 1, !tbaa !11
  %1266 = zext i8 %1265 to i64
  %1267 = shl nuw nsw i64 %1266, 8
  %1268 = or i64 %1267, %1263
  %1269 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 2
  %1270 = load i8, i8 addrspace(4)* %1269, align 1, !tbaa !11
  %1271 = zext i8 %1270 to i64
  %1272 = shl nuw nsw i64 %1271, 16
  %1273 = or i64 %1268, %1272
  %1274 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 3
  %1275 = load i8, i8 addrspace(4)* %1274, align 1, !tbaa !11
  %1276 = zext i8 %1275 to i64
  %1277 = shl nuw nsw i64 %1276, 24
  %1278 = or i64 %1273, %1277
  %1279 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 4
  %1280 = load i8, i8 addrspace(4)* %1279, align 1, !tbaa !11
  %1281 = zext i8 %1280 to i64
  %1282 = shl nuw nsw i64 %1281, 32
  %1283 = or i64 %1278, %1282
  %1284 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 5
  %1285 = load i8, i8 addrspace(4)* %1284, align 1, !tbaa !11
  %1286 = zext i8 %1285 to i64
  %1287 = shl nuw nsw i64 %1286, 40
  %1288 = or i64 %1283, %1287
  %1289 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 6
  %1290 = load i8, i8 addrspace(4)* %1289, align 1, !tbaa !11
  %1291 = zext i8 %1290 to i64
  %1292 = shl nuw nsw i64 %1291, 48
  %1293 = or i64 %1288, %1292
  %1294 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 7
  %1295 = load i8, i8 addrspace(4)* %1294, align 1, !tbaa !11
  %1296 = zext i8 %1295 to i64
  %1297 = shl nuw i64 %1296, 56
  %1298 = or i64 %1293, %1297
  %1299 = add nsw i32 %1256, -8
  %1300 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 8
  br label %1314

1301:                                             ; preds = %1259, %1301
  %1302 = phi i32 [ %1312, %1301 ], [ 0, %1259 ]
  %1303 = phi i64 [ %1311, %1301 ], [ 0, %1259 ]
  %1304 = zext i32 %1302 to i64
  %1305 = getelementptr inbounds i8, i8 addrspace(4)* %1255, i64 %1304
  %1306 = load i8, i8 addrspace(4)* %1305, align 1, !tbaa !11
  %1307 = zext i8 %1306 to i64
  %1308 = shl i32 %1302, 3
  %1309 = zext i32 %1308 to i64
  %1310 = shl nuw i64 %1307, %1309
  %1311 = or i64 %1310, %1303
  %1312 = add nuw nsw i32 %1302, 1
  %1313 = icmp eq i32 %1312, %1256
  br i1 %1313, label %1314, label %1301

1314:                                             ; preds = %1301, %1261, %1259
  %1315 = phi i8 addrspace(4)* [ %1300, %1261 ], [ %1255, %1259 ], [ %1255, %1301 ]
  %1316 = phi i32 [ %1299, %1261 ], [ 0, %1259 ], [ 0, %1301 ]
  %1317 = phi i64 [ %1298, %1261 ], [ 0, %1259 ], [ %1311, %1301 ]
  %1318 = icmp ugt i32 %1316, 7
  br i1 %1318, label %1321, label %1319

1319:                                             ; preds = %1314
  %1320 = icmp eq i32 %1316, 0
  br i1 %1320, label %1374, label %1361

1321:                                             ; preds = %1314
  %1322 = load i8, i8 addrspace(4)* %1315, align 1, !tbaa !11
  %1323 = zext i8 %1322 to i64
  %1324 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 1
  %1325 = load i8, i8 addrspace(4)* %1324, align 1, !tbaa !11
  %1326 = zext i8 %1325 to i64
  %1327 = shl nuw nsw i64 %1326, 8
  %1328 = or i64 %1327, %1323
  %1329 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 2
  %1330 = load i8, i8 addrspace(4)* %1329, align 1, !tbaa !11
  %1331 = zext i8 %1330 to i64
  %1332 = shl nuw nsw i64 %1331, 16
  %1333 = or i64 %1328, %1332
  %1334 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 3
  %1335 = load i8, i8 addrspace(4)* %1334, align 1, !tbaa !11
  %1336 = zext i8 %1335 to i64
  %1337 = shl nuw nsw i64 %1336, 24
  %1338 = or i64 %1333, %1337
  %1339 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 4
  %1340 = load i8, i8 addrspace(4)* %1339, align 1, !tbaa !11
  %1341 = zext i8 %1340 to i64
  %1342 = shl nuw nsw i64 %1341, 32
  %1343 = or i64 %1338, %1342
  %1344 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 5
  %1345 = load i8, i8 addrspace(4)* %1344, align 1, !tbaa !11
  %1346 = zext i8 %1345 to i64
  %1347 = shl nuw nsw i64 %1346, 40
  %1348 = or i64 %1343, %1347
  %1349 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 6
  %1350 = load i8, i8 addrspace(4)* %1349, align 1, !tbaa !11
  %1351 = zext i8 %1350 to i64
  %1352 = shl nuw nsw i64 %1351, 48
  %1353 = or i64 %1348, %1352
  %1354 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 7
  %1355 = load i8, i8 addrspace(4)* %1354, align 1, !tbaa !11
  %1356 = zext i8 %1355 to i64
  %1357 = shl nuw i64 %1356, 56
  %1358 = or i64 %1353, %1357
  %1359 = add nsw i32 %1316, -8
  %1360 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 8
  br label %1374

1361:                                             ; preds = %1319, %1361
  %1362 = phi i32 [ %1372, %1361 ], [ 0, %1319 ]
  %1363 = phi i64 [ %1371, %1361 ], [ 0, %1319 ]
  %1364 = zext i32 %1362 to i64
  %1365 = getelementptr inbounds i8, i8 addrspace(4)* %1315, i64 %1364
  %1366 = load i8, i8 addrspace(4)* %1365, align 1, !tbaa !11
  %1367 = zext i8 %1366 to i64
  %1368 = shl i32 %1362, 3
  %1369 = zext i32 %1368 to i64
  %1370 = shl nuw i64 %1367, %1369
  %1371 = or i64 %1370, %1363
  %1372 = add nuw nsw i32 %1362, 1
  %1373 = icmp eq i32 %1372, %1316
  br i1 %1373, label %1374, label %1361

1374:                                             ; preds = %1361, %1321, %1319
  %1375 = phi i8 addrspace(4)* [ %1360, %1321 ], [ %1315, %1319 ], [ %1315, %1361 ]
  %1376 = phi i32 [ %1359, %1321 ], [ 0, %1319 ], [ 0, %1361 ]
  %1377 = phi i64 [ %1358, %1321 ], [ 0, %1319 ], [ %1371, %1361 ]
  %1378 = icmp ugt i32 %1376, 7
  br i1 %1378, label %1381, label %1379

1379:                                             ; preds = %1374
  %1380 = icmp eq i32 %1376, 0
  br i1 %1380, label %1432, label %1419

1381:                                             ; preds = %1374
  %1382 = load i8, i8 addrspace(4)* %1375, align 1, !tbaa !11
  %1383 = zext i8 %1382 to i64
  %1384 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 1
  %1385 = load i8, i8 addrspace(4)* %1384, align 1, !tbaa !11
  %1386 = zext i8 %1385 to i64
  %1387 = shl nuw nsw i64 %1386, 8
  %1388 = or i64 %1387, %1383
  %1389 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 2
  %1390 = load i8, i8 addrspace(4)* %1389, align 1, !tbaa !11
  %1391 = zext i8 %1390 to i64
  %1392 = shl nuw nsw i64 %1391, 16
  %1393 = or i64 %1388, %1392
  %1394 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 3
  %1395 = load i8, i8 addrspace(4)* %1394, align 1, !tbaa !11
  %1396 = zext i8 %1395 to i64
  %1397 = shl nuw nsw i64 %1396, 24
  %1398 = or i64 %1393, %1397
  %1399 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 4
  %1400 = load i8, i8 addrspace(4)* %1399, align 1, !tbaa !11
  %1401 = zext i8 %1400 to i64
  %1402 = shl nuw nsw i64 %1401, 32
  %1403 = or i64 %1398, %1402
  %1404 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 5
  %1405 = load i8, i8 addrspace(4)* %1404, align 1, !tbaa !11
  %1406 = zext i8 %1405 to i64
  %1407 = shl nuw nsw i64 %1406, 40
  %1408 = or i64 %1403, %1407
  %1409 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 6
  %1410 = load i8, i8 addrspace(4)* %1409, align 1, !tbaa !11
  %1411 = zext i8 %1410 to i64
  %1412 = shl nuw nsw i64 %1411, 48
  %1413 = or i64 %1408, %1412
  %1414 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 7
  %1415 = load i8, i8 addrspace(4)* %1414, align 1, !tbaa !11
  %1416 = zext i8 %1415 to i64
  %1417 = shl nuw i64 %1416, 56
  %1418 = or i64 %1413, %1417
  br label %1432

1419:                                             ; preds = %1379, %1419
  %1420 = phi i32 [ %1430, %1419 ], [ 0, %1379 ]
  %1421 = phi i64 [ %1429, %1419 ], [ 0, %1379 ]
  %1422 = zext i32 %1420 to i64
  %1423 = getelementptr inbounds i8, i8 addrspace(4)* %1375, i64 %1422
  %1424 = load i8, i8 addrspace(4)* %1423, align 1, !tbaa !11
  %1425 = zext i8 %1424 to i64
  %1426 = shl i32 %1420, 3
  %1427 = zext i32 %1426 to i64
  %1428 = shl nuw i64 %1425, %1427
  %1429 = or i64 %1428, %1421
  %1430 = add nuw nsw i32 %1420, 1
  %1431 = icmp eq i32 %1430, %1376
  br i1 %1431, label %1432, label %1419

1432:                                             ; preds = %1419, %1381, %1379
  %1433 = phi i64 [ %1418, %1381 ], [ 0, %1379 ], [ %1429, %1419 ]
  %1434 = shl nuw nsw i64 %1015, 2
  %1435 = add nuw nsw i64 %1434, 28
  %1436 = and i64 %1435, 480
  %1437 = and i64 %1017, -225
  %1438 = or i64 %1437, %1436
  %1439 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %1438, i64 noundef %1077, i64 noundef %1137, i64 noundef %1197, i64 noundef %1257, i64 noundef %1317, i64 noundef %1377, i64 noundef %1433) #12
  %1440 = sub i64 %1007, %1015
  %1441 = getelementptr inbounds i8, i8 addrspace(4)* %1008, i64 %1015
  %1442 = icmp eq i64 %1440, 0
  br i1 %1442, label %1443, label %1006

1443:                                             ; preds = %1432, %998
  %1444 = phi <2 x i64> [ %1001, %998 ], [ %1439, %1432 ]
  %1445 = extractelement <2 x i64> %1444, i64 0
  %1446 = and i64 %1445, -225
  %1447 = or i64 %1446, 32
  %1448 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %1447, i64 noundef %471, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1449 = extractelement <2 x i64> %1448, i64 0
  %1450 = and i64 %1449, -225
  %1451 = or i64 %1450, 32
  %1452 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %1451, i64 noundef %476, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1453 = extractelement <2 x i64> %1452, i64 0
  %1454 = zext i32 %994 to i64
  %1455 = and i64 %1453, -227
  %1456 = or i64 %1455, 34
  %1457 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i32 noundef 2, i64 noundef %1456, i64 noundef %1454, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %1458 = sext i32 %12 to i64
  %1459 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1458
  %1460 = sitofp i32 %989 to float
  %1461 = load float, float addrspace(1)* %1459, align 4, !tbaa !19
  %1462 = fsub contract float %1460, %1461
  %1463 = atomicrmw fadd float addrspace(1)* %1459, float %1462 syncscope("agent-one-as") monotonic, align 4
  br label %1466

1464:                                             ; preds = %988
  %1465 = icmp eq i32 %994, %2
  br i1 %1465, label %1466, label %988, !llvm.loop !24

1466:                                             ; preds = %1464, %502, %506, %1443, %500
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #2

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 noundef %0) unnamed_addr #3 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %1423, label %3

3:                                                ; preds = %1
  %4 = icmp ugt i64 %0, 3072
  br i1 %4, label %5, label %27

5:                                                ; preds = %3
  %6 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 24
  %8 = bitcast i8 addrspace(4)* %7 to i64 addrspace(4)*
  %9 = load i64, i64 addrspace(4)* %8, align 8, !tbaa !7
  %10 = inttoptr i64 %9 to i8 addrspace(1)*
  %11 = addrspacecast i8 addrspace(1)* %10 to i8*
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %11, i32 noundef 3, i64 noundef 0, i64 noundef %0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %13 = extractelement <2 x i64> %12, i64 0
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %5
  %16 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %17 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %17, i32 0)
  %19 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %16, i32 %18)
  %20 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %21 = icmp eq i32 %19, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %15
  %23 = tail call i64 @llvm.ctpop.i64(i64 %20), !range !28
  %24 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %23 syncscope("agent-one-as") monotonic, align 8
  br label %25

25:                                               ; preds = %22, %15, %5
  %26 = inttoptr i64 %13 to i8 addrspace(1)*
  br label %1423

27:                                               ; preds = %3
  %28 = trunc i64 %0 to i32
  %29 = tail call i32 @llvm.umax.i32(i32 %28, i32 16)
  %30 = tail call i32 @llvm.ctlz.i32(i32 %29, i1 false), !range !29
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
  %66 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %64) #12, !srcloc !30
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
  %75 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %73) #12, !srcloc !30
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %1410, label %77

77:                                               ; preds = %71
  %78 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %79 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %80 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %79, i32 0)
  %81 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %78, i32 %80)
  %82 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %81) #12, !srcloc !31
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
  %91 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %92 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %93 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %92, i32 0)
  %94 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %91, i32 %93)
  %95 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %96 = tail call i64 @llvm.ctpop.i64(i64 %95), !range !28
  %97 = trunc i64 %96 to i32
  br label %98

98:                                               ; preds = %631, %90
  %99 = phi i32 [ %94, %90 ], [ %102, %631 ]
  %100 = phi i32 [ %88, %90 ], [ %632, %631 ]
  %101 = phi %3 addrspace(1)* [ undef, %90 ], [ %633, %631 ]
  %102 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %99) #12, !srcloc !31
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
  %113 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !32
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
  %139 = tail call i64 @llvm.cttz.i64(i64 %136, i1 true), !range !28
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
  %176 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %177 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %178 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %177, i32 0)
  %179 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %176, i32 %178)
  br label %180

180:                                              ; preds = %548, %174
  %181 = phi i32 [ %179, %174 ], [ %550, %548 ]
  %182 = phi %3 addrspace(1)* [ undef, %174 ], [ %551, %548 ]
  %183 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %181) #12, !srcloc !31
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
  %202 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %203 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %204 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %203, i32 0)
  %205 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %202, i32 %204)
  %206 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %205) #12, !srcloc !31
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
  %230 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  %247 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %248 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %249 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %248, i32 0)
  %250 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %247, i32 %249)
  %251 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %252 = tail call i64 @llvm.ctpop.i64(i64 %251), !range !28
  %253 = trunc i64 %252 to i32
  %254 = inttoptr i64 %244 to i64 addrspace(1)*
  %255 = icmp ult i32 %250, 768
  br i1 %255, label %256, label %262

256:                                              ; preds = %246, %256
  %257 = phi i32 [ %260, %256 ], [ %250, %246 ]
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds i64, i64 addrspace(1)* %254, i64 %258
  store i64 0, i64 addrspace(1)* %259, align 8, !tbaa !7
  %260 = add i32 %257, %253
  %261 = icmp ult i32 %260, 768
  br i1 %261, label %256, label %262

262:                                              ; preds = %256, %246
  br label %263

263:                                              ; preds = %262, %295
  %264 = phi i32 [ %293, %295 ], [ %226, %262 ]
  %265 = phi i32 [ %273, %295 ], [ %212, %262 ]
  %266 = phi i32 [ %267, %295 ], [ %206, %262 ]
  %267 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %266) #12, !srcloc !31
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
  %277 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  %300 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %301 = tail call i32 @llvm.read_register.i32(metadata !26) #13
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
  %402 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !35
  %403 = icmp ult i64 %401, %402
  br i1 %403, label %404, label %407

404:                                              ; preds = %400
  %405 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %406 = icmp ult i64 %405, %402
  br i1 %406, label %413, label %407

407:                                              ; preds = %404, %400
  %408 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  %426 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %427 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %428 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %427, i32 0)
  %429 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %426, i32 %428)
  %430 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %429) #12, !srcloc !31
  %431 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %432 = tail call i64 @llvm.ctpop.i64(i64 %431), !range !28
  %433 = trunc i64 %432 to i32
  %434 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !37
  %435 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !38
  %436 = add i32 %435, 31
  %437 = lshr i32 %436, 5
  br i1 %55, label %461, label %438

438:                                              ; preds = %424
  %439 = icmp ult i32 %430, %437
  br i1 %439, label %446, label %440

440:                                              ; preds = %446, %438
  %441 = mul i32 %434, %433
  %442 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !39
  %443 = mul i32 %434, %430
  %444 = add i32 %442, %443
  %445 = icmp ult i32 %444, %435
  br i1 %445, label %452, label %470

446:                                              ; preds = %438, %446
  %447 = phi i32 [ %450, %446 ], [ %430, %438 ]
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %448
  store i32 0, i32 addrspace(1)* %449, align 4, !tbaa !40
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
  store i32 %455, i32 addrspace(1)* %458, align 4, !tbaa !40
  %459 = add i32 %453, %441
  %460 = icmp ult i32 %459, %435
  br i1 %460, label %452, label %470

461:                                              ; preds = %424
  %462 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !41
  %463 = icmp ult i32 %430, %437
  br i1 %463, label %464, label %470

464:                                              ; preds = %461, %464
  %465 = phi i32 [ %468, %464 ], [ %430, %461 ]
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %466
  store i32 %462, i32 addrspace(1)* %467, align 4, !tbaa !40
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
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !40
  %480 = or i32 %479, %475
  store i32 %480, i32 addrspace(1)* %478, align 4, !tbaa !40
  br label %481

481:                                              ; preds = %473, %472
  %482 = inttoptr i64 %422 to <4 x i32> addrspace(1)*
  store <4 x i32> %59, <4 x i32> addrspace(1)* %482, align 16, !tbaa !11
  br label %483

483:                                              ; preds = %481, %470
  %484 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 1
  br label %485

485:                                              ; preds = %547, %483
  %486 = phi i32 [ %199, %483 ], [ %502, %547 ]
  %487 = phi i32 [ %189, %483 ], [ %495, %547 ]
  %488 = phi i32 [ %183, %483 ], [ %489, %547 ]
  %489 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %488) #12, !srcloc !31
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
  %506 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  store i32 %495, i32 addrspace(1)* %484, align 4, !tbaa !42
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
  %555 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %556 = tail call i32 @llvm.read_register.i32(metadata !26) #13
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
  %635 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %636 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %637 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %636, i32 0)
  %638 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %635, i32 %637)
  %639 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %640 = tail call i64 @llvm.ctpop.i64(i64 %639), !range !28
  %641 = trunc i64 %640 to i32
  br label %642

642:                                              ; preds = %1295, %634
  %643 = phi i32 [ %43, %634 ], [ %1297, %1295 ]
  %644 = phi i32 [ %638, %634 ], [ %646, %1295 ]
  %645 = phi %3 addrspace(1)* [ undef, %634 ], [ %1298, %1295 ]
  %646 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %644) #12, !srcloc !31
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
  %658 = load i32, i32 addrspace(4)* %657, align 4, !tbaa !44
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
  %685 = tail call i64 @llvm.cttz.i64(i64 %682, i1 true), !range !28
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
  %736 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %737 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %738 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %737, i32 0)
  %739 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %736, i32 %738)
  %740 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %741 = tail call i64 @llvm.ctpop.i64(i64 %740), !range !28
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
  %763 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %760) #12, !srcloc !31
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
  %774 = load i32, i32 addrspace(4)* %745, align 4, !tbaa !32
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
  %800 = tail call i64 @llvm.cttz.i64(i64 %797, i1 true), !range !28
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
  %837 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %838 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %839 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %838, i32 0)
  %840 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %837, i32 %839)
  br label %841

841:                                              ; preds = %1209, %835
  %842 = phi i32 [ %840, %835 ], [ %1211, %1209 ]
  %843 = phi %3 addrspace(1)* [ undef, %835 ], [ %1212, %1209 ]
  %844 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %842) #12, !srcloc !31
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
  %863 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %864 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %865 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %864, i32 0)
  %866 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %863, i32 %865)
  %867 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %866) #12, !srcloc !31
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
  %891 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  %908 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %909 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %910 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %909, i32 0)
  %911 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %908, i32 %910)
  %912 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %913 = tail call i64 @llvm.ctpop.i64(i64 %912), !range !28
  %914 = trunc i64 %913 to i32
  %915 = inttoptr i64 %905 to i64 addrspace(1)*
  %916 = icmp ult i32 %911, 768
  br i1 %916, label %917, label %923

917:                                              ; preds = %907, %917
  %918 = phi i32 [ %921, %917 ], [ %911, %907 ]
  %919 = zext i32 %918 to i64
  %920 = getelementptr inbounds i64, i64 addrspace(1)* %915, i64 %919
  store i64 0, i64 addrspace(1)* %920, align 8, !tbaa !7
  %921 = add i32 %918, %914
  %922 = icmp ult i32 %921, 768
  br i1 %922, label %917, label %923

923:                                              ; preds = %917, %907
  br label %924

924:                                              ; preds = %923, %956
  %925 = phi i32 [ %954, %956 ], [ %887, %923 ]
  %926 = phi i32 [ %934, %956 ], [ %873, %923 ]
  %927 = phi i32 [ %928, %956 ], [ %867, %923 ]
  %928 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %927) #12, !srcloc !31
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
  %938 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  %961 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %962 = tail call i32 @llvm.read_register.i32(metadata !26) #13
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
  %1063 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !35
  %1064 = icmp ult i64 %1062, %1063
  br i1 %1064, label %1065, label %1068

1065:                                             ; preds = %1061
  %1066 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %1067 = icmp ult i64 %1066, %1063
  br i1 %1067, label %1074, label %1068

1068:                                             ; preds = %1065, %1061
  %1069 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  %1087 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %1088 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %1089 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1088, i32 0)
  %1090 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1087, i32 %1089)
  %1091 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1090) #12, !srcloc !31
  %1092 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %1093 = tail call i64 @llvm.ctpop.i64(i64 %1092), !range !28
  %1094 = trunc i64 %1093 to i32
  %1095 = load i32, i32 addrspace(4)* %750, align 4, !tbaa !37
  %1096 = load i32, i32 addrspace(4)* %751, align 4, !tbaa !38
  %1097 = add i32 %1096, 31
  %1098 = lshr i32 %1097, 5
  br i1 %754, label %1122, label %1099

1099:                                             ; preds = %1085
  %1100 = icmp ult i32 %1091, %1098
  br i1 %1100, label %1107, label %1101

1101:                                             ; preds = %1107, %1099
  %1102 = mul i32 %1095, %1094
  %1103 = load i32, i32 addrspace(4)* %755, align 4, !tbaa !39
  %1104 = mul i32 %1095, %1091
  %1105 = add i32 %1103, %1104
  %1106 = icmp ult i32 %1105, %1096
  br i1 %1106, label %1113, label %1131

1107:                                             ; preds = %1099, %1107
  %1108 = phi i32 [ %1111, %1107 ], [ %1091, %1099 ]
  %1109 = zext i32 %1108 to i64
  %1110 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1109
  store i32 0, i32 addrspace(1)* %1110, align 4, !tbaa !40
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
  store i32 %1116, i32 addrspace(1)* %1119, align 4, !tbaa !40
  %1120 = add i32 %1114, %1102
  %1121 = icmp ult i32 %1120, %1096
  br i1 %1121, label %1113, label %1131

1122:                                             ; preds = %1085
  %1123 = load i32, i32 addrspace(4)* %756, align 4, !tbaa !41
  %1124 = icmp ult i32 %1091, %1098
  br i1 %1124, label %1125, label %1131

1125:                                             ; preds = %1122, %1125
  %1126 = phi i32 [ %1129, %1125 ], [ %1091, %1122 ]
  %1127 = zext i32 %1126 to i64
  %1128 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1127
  store i32 %1123, i32 addrspace(1)* %1128, align 4, !tbaa !40
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
  %1140 = load i32, i32 addrspace(1)* %1139, align 4, !tbaa !40
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32 addrspace(1)* %1139, align 4, !tbaa !40
  br label %1142

1142:                                             ; preds = %1134, %1133
  %1143 = inttoptr i64 %1083 to <4 x i32> addrspace(1)*
  store <4 x i32> %758, <4 x i32> addrspace(1)* %1143, align 16, !tbaa !11
  br label %1144

1144:                                             ; preds = %1142, %1131
  %1145 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 1
  br label %1146

1146:                                             ; preds = %1208, %1144
  %1147 = phi i32 [ %860, %1144 ], [ %1163, %1208 ]
  %1148 = phi i32 [ %850, %1144 ], [ %1156, %1208 ]
  %1149 = phi i32 [ %844, %1144 ], [ %1150, %1208 ]
  %1150 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1149) #12, !srcloc !31
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
  %1167 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !7
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
  store i32 %1156, i32 addrspace(1)* %1145, align 4, !tbaa !42
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
  %1216 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %1217 = tail call i32 @llvm.read_register.i32(metadata !26) #13
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
  %1313 = tail call i32 @llvm.read_register.i32(metadata !25) #13
  %1314 = tail call i32 @llvm.read_register.i32(metadata !26) #13
  %1315 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1314, i32 0)
  %1316 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1313, i32 %1315)
  %1317 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1316) #12, !srcloc !31
  %1318 = tail call i64 @llvm.read_register.i64(metadata !27) #13
  %1319 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 1
  %1320 = load atomic i64, i64 addrspace(1)* %1319 seq_cst, align 8, !tbaa !45
  %1321 = inttoptr i64 %1320 to %5 addrspace(1)*
  %1322 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 0
  %1323 = load i32, i32 addrspace(1)* %1322, align 4, !tbaa !47
  %1324 = icmp eq i32 %1317, 0
  br i1 %1324, label %1325, label %1330

1325:                                             ; preds = %1311
  %1326 = tail call i64 @llvm.ctpop.i64(i64 %1318), !range !28
  %1327 = trunc i64 %1326 to i32
  %1328 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 2
  %1329 = atomicrmw add i32 addrspace(1)* %1328, i32 %1327 syncscope("agent-one-as") monotonic, align 4
  br label %1330

1330:                                             ; preds = %1325, %1311
  %1331 = phi i32 [ %1329, %1325 ], [ 0, %1311 ]
  %1332 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1331)
  %1333 = zext i32 %1323 to i64
  %1334 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 0
  %1335 = load i32, i32 addrspace(4)* %1334, align 4, !tbaa !38
  %1336 = add i32 %1335, 31
  %1337 = lshr i32 %1336, 5
  %1338 = icmp ult i32 %1336, 32
  br i1 %1338, label %1397, label %1339

1339:                                             ; preds = %1330
  %1340 = add i32 %1332, %1317
  %1341 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 7
  %1342 = load i32, i32 addrspace(4)* %1341, align 4, !tbaa !48
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
  %1367 = tail call i32 @llvm.cttz.i32(i32 %1366, i1 false), !range !29
  %1368 = and i32 %1367, 31
  %1369 = shl nuw i32 1, %1368
  %1370 = atomicrmw or i32 addrspace(1)* %1362, i32 %1369 syncscope("agent-one-as") monotonic, align 4
  %1371 = and i32 %1370, %1369
  %1372 = icmp eq i32 %1371, 0
  br i1 %1372, label %1373, label %1382

1373:                                             ; preds = %1365
  %1374 = shl i32 %1358, 5
  %1375 = add i32 %1367, %1374
  %1376 = load i32, i32 addrspace(4)* %1347, align 4, !tbaa !49
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
  %1402 = tail call i64 @llvm.ctpop.i64(i64 %1400), !range !28
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
  %1414 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1412) #12, !srcloc !50
  %1415 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1414, i32 noundef 0, i32 noundef 33) #14
  %1416 = icmp eq i64 %1415, 0
  br i1 %1416, label %1417, label %71

1417:                                             ; preds = %1410, %68, %63
  %1418 = phi i32 [ 0, %63 ], [ %66, %68 ], [ %1411, %1410 ]
  %1419 = phi i8 addrspace(1)* [ %65, %63 ], [ %65, %68 ], [ %1413, %1410 ]
  %1420 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1418) #12, !srcloc !50
  %1421 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1420, i32 noundef 0, i32 noundef 33) #14
  %1422 = icmp eq i64 %1421, 0
  br i1 %1422, label %1423, label %63

1423:                                             ; preds = %1417, %25, %1
  %1424 = phi i8 addrspace(1)* [ %26, %25 ], [ null, %1 ], [ %1419, %1417 ]
  ret i8 addrspace(1)* %1424
}

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #2

; Function Attrs: nofree nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i32(i32, i32, i32 immarg) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.ds.bpermute(i32, i32) #6

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #7

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i64(i64, i64, i32 immarg) #6

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #8

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) unnamed_addr #9 {
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
  store i8* %0, i8* addrspace(5)* %11, align 8, !tbaa !51
  store i32 %1, i32 addrspace(5)* %12, align 4, !tbaa !40
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  store i64 %9, i64 addrspace(5)* %20, align 8, !tbaa !7
  %28 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %28) #10
  %29 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %30 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %29)
  store i32 %30, i32 addrspace(5)* %21, align 4, !tbaa !40
  %31 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %32 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %31) #12, !srcloc !53
  store i32 %32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %33 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %33) #10
  %34 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %35 = call i32 @llvm.amdgcn.readfirstlane(i32 %34)
  store i32 %35, i32 addrspace(5)* %22, align 4, !tbaa !40
  %36 = bitcast %6 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %36) #10
  %37 = load i8*, i8* addrspace(5)* %11, align 8, !tbaa !51
  %38 = addrspacecast i8* %37 to %6 addrspace(1)*
  store %6 addrspace(1)* %38, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !51
  %39 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %39) #10
  %40 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !51
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %42 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !40
  %43 = icmp eq i32 %41, %42
  br i1 %43, label %44, label %69

44:                                               ; preds = %10
  %45 = getelementptr inbounds %6, %6 addrspace(1)* %40, i64 0, i32 3
  %46 = load atomic i64, i64 addrspace(1)* %45 syncscope("one-as") acquire, align 8
  %47 = getelementptr %6, %6 addrspace(1)* %40, i64 0, i32 0
  %48 = getelementptr %6, %6 addrspace(1)* %40, i64 0, i32 5
  %49 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %47, align 8, !tbaa !54
  %50 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !57
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
  %59 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %47, align 8, !tbaa !54
  %60 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !57
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
  store i64 %79, i64 addrspace(5)* %24, align 8, !tbaa !7
  %80 = bitcast %7 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %80) #10
  %81 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !51
  %82 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %83 = getelementptr %6, %6 addrspace(1)* %81, i64 0, i32 0
  %84 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %83, align 8, !tbaa !54
  %85 = getelementptr %6, %6 addrspace(1)* %81, i64 0, i32 5
  %86 = load i64, i64 addrspace(1)* %85, align 8, !tbaa !57
  %87 = and i64 %82, %86
  %88 = getelementptr inbounds %7, %7 addrspace(1)* %84, i64 %87
  store %7 addrspace(1)* %88, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !51
  %89 = bitcast %8 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %89) #10
  %90 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !51
  %91 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %92 = getelementptr %6, %6 addrspace(1)* %90, i64 0, i32 1
  %93 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(1)* %92, align 8, !tbaa !58
  %94 = getelementptr %6, %6 addrspace(1)* %90, i64 0, i32 5
  %95 = load i64, i64 addrspace(1)* %94, align 8, !tbaa !57
  %96 = and i64 %91, %95
  %97 = getelementptr inbounds %8, %8 addrspace(1)* %93, i64 %96
  store %8 addrspace(1)* %97, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !51
  %98 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !51
  %99 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !51
  %100 = load i32, i32 addrspace(5)* %12, align 4, !tbaa !40
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i64, i64 addrspace(5)* %20, align 8, !tbaa !7
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %110 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !40
  %111 = call i64 @llvm.read_register.i64(metadata !27) #13
  %112 = icmp eq i32 %109, %110
  br i1 %112, label %113, label %117

113:                                              ; preds = %69
  %114 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 2
  store i32 %100, i32 addrspace(1)* %114, align 8, !tbaa !59
  %115 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 1
  store i64 %111, i64 addrspace(1)* %115, align 8, !tbaa !61
  %116 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %116, align 4, !tbaa !62
  br label %117

117:                                              ; preds = %69, %113
  %118 = zext i32 %109 to i64
  %119 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 0
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !7
  %120 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 1
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !7
  %121 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 2
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !7
  %122 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 3
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !7
  %123 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 4
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !7
  %124 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 5
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !7
  %125 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 6
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !7
  %126 = getelementptr inbounds %8, %8 addrspace(1)* %99, i64 0, i32 0, i64 %118, i64 7
  store i64 %108, i64 addrspace(1)* %126, align 8, !tbaa !7
  %127 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !51
  %128 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %130 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !40
  %131 = icmp eq i32 %129, %130
  br i1 %131, label %132, label %164

132:                                              ; preds = %117
  %133 = getelementptr inbounds %6, %6 addrspace(1)* %127, i64 0, i32 4
  %134 = load atomic i64, i64 addrspace(1)* %133 syncscope("one-as") monotonic, align 8
  %135 = getelementptr %6, %6 addrspace(1)* %127, i64 0, i32 0
  %136 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %135, align 8, !tbaa !54
  %137 = getelementptr %6, %6 addrspace(1)* %127, i64 0, i32 5
  %138 = load i64, i64 addrspace(1)* %137, align 8, !tbaa !57
  %139 = and i64 %138, %128
  %140 = getelementptr inbounds %7, %7 addrspace(1)* %136, i64 %139, i32 0
  store i64 %134, i64 addrspace(1)* %140, align 8, !tbaa !63
  %141 = cmpxchg i64 addrspace(1)* %133, i64 %134, i64 %128 syncscope("one-as") release monotonic, align 8
  %142 = extractvalue { i64, i1 } %141, 1
  br i1 %142, label %148, label %143

143:                                              ; preds = %143, %132
  %144 = phi { i64, i1 } [ %146, %143 ], [ %141, %132 ]
  %145 = extractvalue { i64, i1 } %144, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %145, i64 addrspace(1)* %140, align 8, !tbaa !63
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
  %155 = load i64, i64 addrspace(1)* %154, align 16, !tbaa !64
  %156 = icmp eq i64 %155, 0
  br i1 %156, label %164, label %157

157:                                              ; preds = %148
  %158 = inttoptr i64 %155 to i64 addrspace(1)*
  %159 = getelementptr inbounds %10, %10 addrspace(1)* %151, i64 0, i32 3
  %160 = load i32, i32 addrspace(1)* %159, align 8, !tbaa !66
  %161 = zext i32 %160 to i64
  store atomic i64 %161, i64 addrspace(1)* %158 syncscope("one-as") release, align 8
  %162 = call i32 @llvm.amdgcn.readfirstlane(i32 %160)
  %163 = and i32 %162, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %163)
  br label %164

164:                                              ; preds = %117, %148, %157
  %165 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %165) #10
  %166 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !51
  %167 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !51
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %169 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !40
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
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !7
  %186 = load i64, i64 addrspace(1)* %184, align 8, !tbaa !7
  %187 = insertelement <2 x i64> undef, i64 %185, i64 0
  %188 = insertelement <2 x i64> %187, i64 %186, i64 1
  store <2 x i64> %188, <2 x i64> addrspace(5)* %27, align 16, !tbaa !11
  %189 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !51
  %190 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !40
  %192 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !40
  %193 = icmp eq i32 %191, %192
  br i1 %193, label %194, label %214

194:                                              ; preds = %181
  %195 = getelementptr inbounds %6, %6 addrspace(1)* %189, i64 0, i32 5
  %196 = load i64, i64 addrspace(1)* %195, align 8, !tbaa !57
  %197 = add i64 %196, 1
  %198 = add i64 %197, %190
  %199 = icmp eq i64 %198, 0
  %200 = select i1 %199, i64 %197, i64 %198
  %201 = getelementptr inbounds %6, %6 addrspace(1)* %189, i64 0, i32 3
  %202 = load atomic i64, i64 addrspace(1)* %201 syncscope("one-as") monotonic, align 8
  %203 = getelementptr %6, %6 addrspace(1)* %189, i64 0, i32 0
  %204 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %203, align 8, !tbaa !54
  %205 = and i64 %200, %196
  %206 = getelementptr inbounds %7, %7 addrspace(1)* %204, i64 %205, i32 0
  store i64 %202, i64 addrspace(1)* %206, align 8, !tbaa !63
  %207 = cmpxchg i64 addrspace(1)* %201, i64 %202, i64 %200 syncscope("one-as") release monotonic, align 8
  %208 = extractvalue { i64, i1 } %207, 1
  br i1 %208, label %214, label %209

209:                                              ; preds = %209, %194
  %210 = phi { i64, i1 } [ %212, %209 ], [ %207, %194 ]
  %211 = extractvalue { i64, i1 } %210, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %211, i64 addrspace(1)* %206, align 8, !tbaa !63
  %212 = cmpxchg i64 addrspace(1)* %201, i64 %211, i64 %200 syncscope("one-as") release monotonic, align 8
  %213 = extractvalue { i64, i1 } %212, 1
  br i1 %213, label %214, label %209

214:                                              ; preds = %181, %194, %209
  %215 = load <2 x i64>, <2 x i64> addrspace(5)* %27, align 16, !tbaa !11
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

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #11

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent noinline norecurse nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { nofree nounwind readonly }
attributes #5 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nounwind willreturn }
attributes #8 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #9 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #10 = { nounwind }
attributes #11 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C++ TBAA"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !15, i64 0}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !15, i64 0}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18}
!25 = !{!"exec_hi"}
!26 = !{!"exec_lo"}
!27 = !{!"exec"}
!28 = !{i64 0, i64 65}
!29 = !{i32 0, i32 33}
!30 = !{i64 7014}
!31 = !{i64 7137}
!32 = !{!33, !34, i64 8}
!33 = !{!"kind_info_s", !34, i64 0, !34, i64 4, !34, i64 8, !34, i64 12, !34, i64 16, !34, i64 20, !34, i64 24, !34, i64 28}
!34 = !{!"int", !9, i64 0}
!35 = !{!36, !8, i64 108552}
!36 = !{!"heap_s", !9, i64 0, !9, i64 2048, !9, i64 4096, !9, i64 6144, !9, i64 8192, !9, i64 10240, !9, i64 108544, !8, i64 108552, !9, i64 108560, !9, i64 108672}
!37 = !{!33, !34, i64 20}
!38 = !{!33, !34, i64 0}
!39 = !{!33, !34, i64 16}
!40 = !{!34, !34, i64 0}
!41 = !{!33, !34, i64 24}
!42 = !{!43, !34, i64 4}
!43 = !{!"slab_s", !34, i64 0, !34, i64 4, !9, i64 8, !34, i64 12, !9, i64 16}
!44 = !{!33, !34, i64 4}
!45 = !{!46, !9, i64 8}
!46 = !{!"sdata_s", !9, i64 0, !9, i64 8, !9, i64 16}
!47 = !{!43, !34, i64 0}
!48 = !{!33, !34, i64 28}
!49 = !{!33, !34, i64 12}
!50 = !{i64 751}
!51 = !{!52, !52, i64 0}
!52 = !{!"any pointer", !9, i64 0}
!53 = !{i64 2662}
!54 = !{!55, !52, i64 0}
!55 = !{!"", !52, i64 0, !52, i64 8, !56, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!56 = !{!"hsa_signal_s", !8, i64 0}
!57 = !{!55, !8, i64 40}
!58 = !{!55, !52, i64 8}
!59 = !{!60, !34, i64 16}
!60 = !{!"", !8, i64 0, !8, i64 8, !34, i64 16, !34, i64 20}
!61 = !{!60, !8, i64 8}
!62 = !{!60, !34, i64 20}
!63 = !{!60, !8, i64 0}
!64 = !{!65, !8, i64 16}
!65 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !34, i64 24, !34, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!66 = !{!65, !34, i64 24}
