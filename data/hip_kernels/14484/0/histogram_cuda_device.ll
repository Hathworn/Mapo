; ModuleID = '../data/hip_kernels/14484/0/main.cu'
source_filename = "../data/hip_kernels/14484/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [15 x i8] c"Bin size : %f\0A\00", align 1
@s_bins = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4
@0 = internal addrspace(1) global %0 zeroinitializer, align 8
@1 = internal unnamed_addr addrspace(4) constant [16 x %4] [%4 { i32 130054, i32 129546, i32 110114, i32 16288, i32 6, i32 256, i32 0, i32 4195 }, %4 { i32 86927, i32 86758, i32 73744, i32 10904, i32 399, i32 512, i32 0, i32 2804 }, %4 { i32 65280, i32 64770, i32 55054, i32 8192, i32 0, i32 128, i32 0, i32 2107 }, %4 { i32 43576, i32 43406, i32 36895, i32 5504, i32 56, i32 256, i32 0, i32 1405 }, %4 { i32 32703, i32 32193, i32 27364, i32 4160, i32 63, i32 64, i32 0, i32 1054 }, %4 { i32 21816, i32 21646, i32 18399, i32 2816, i32 56, i32 128, i32 0, i32 703 }, %4 { i32 16367, i32 15856, i32 13477, i32 2176, i32 15, i32 32, i32 32768, i32 527 }, %4 { i32 10915, i32 10745, i32 9133, i32 1472, i32 35, i32 64, i32 0, i32 352 }, %4 { i32 8187, i32 7676, i32 6524, i32 1280, i32 11, i32 16, i32 134219776, i32 265 }, %4 { i32 5459, i32 5289, i32 4495, i32 896, i32 19, i32 32, i32 524288, i32 176 }, %4 { i32 4094, i32 3583, i32 3045, i32 1024, i32 6, i32 8, i32 1077952576, i32 133 }, %4 { i32 2730, i32 2560, i32 2176, i32 512, i32 10, i32 16, i32 67109888, i32 89 }, %4 { i32 2047, i32 1536, i32 1305, i32 1024, i32 3, i32 4, i32 -2004318072, i32 66 }, %4 { i32 1365, i32 1195, i32 1015, i32 512, i32 5, i32 8, i32 538976288, i32 44 }, %4 { i32 1023, i32 512, i32 435, i32 2048, i32 1, i32 2, i32 -1431655766, i32 34 }, %4 { i32 682, i32 512, i32 435, i32 2048, i32 2, i32 4, i32 1145324612, i32 35 }], align 4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z14histogram_cudaPiPfmffii(i32 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i64 %2, float %3, float %4, i32 %5, i32 %6) local_unnamed_addr #1 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul i32 %16, 30
  %18 = sext i32 %5 to i64
  %19 = shl nsw i64 %18, 2
  %20 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %19) #13
  %21 = bitcast i8 addrspace(1)* %20 to i32 addrspace(1)*
  %22 = icmp eq i32 %17, 0
  br i1 %22, label %23, label %485

23:                                               ; preds = %7
  %24 = fpext float %3 to double
  %25 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 24
  %27 = bitcast i8 addrspace(4)* %26 to i64 addrspace(4)*
  %28 = load i64, i64 addrspace(4)* %27, align 8, !tbaa !7
  %29 = inttoptr i64 %28 to i8 addrspace(1)*
  %30 = addrspacecast i8 addrspace(1)* %29 to i8*
  %31 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i32 noundef 2, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  %32 = extractelement <2 x i64> %31, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %33, label %37

33:                                               ; preds = %23
  %34 = and i64 %32, -225
  %35 = or i64 %34, 32
  %36 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i32 noundef 2, i64 noundef %35, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  br label %478

37:                                               ; preds = %23
  %38 = and i64 %32, 2
  %39 = and i64 %32, -3
  %40 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %39, i64 0
  br label %41

41:                                               ; preds = %467, %37
  %42 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str to [15 x i8]*) to i64)), i64 1))), %37 ], [ %475, %467 ]
  %43 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0), %37 ], [ %476, %467 ]
  %44 = phi <2 x i64> [ %40, %37 ], [ %474, %467 ]
  %45 = icmp ugt i64 %42, 56
  %46 = extractelement <2 x i64> %44, i64 0
  %47 = or i64 %46, %38
  %48 = insertelement <2 x i64> poison, i64 %47, i64 0
  %49 = select i1 %45, <2 x i64> %44, <2 x i64> %48
  %50 = tail call i64 @llvm.umin.i64(i64 %42, i64 56)
  %51 = trunc i64 %50 to i32
  %52 = extractelement <2 x i64> %49, i64 0
  %53 = icmp ugt i32 %51, 7
  br i1 %53, label %56, label %54

54:                                               ; preds = %41
  %55 = icmp eq i32 %51, 0
  br i1 %55, label %109, label %96

56:                                               ; preds = %41
  %57 = load i8, i8 addrspace(4)* %43, align 1, !tbaa !11
  %58 = zext i8 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 1
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !11
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 8
  %63 = or i64 %62, %58
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 2
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !11
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 16
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 3
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !11
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 24
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 4
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !11
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 32
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 5
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !11
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 40
  %83 = or i64 %78, %82
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 6
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !11
  %86 = zext i8 %85 to i64
  %87 = shl nuw nsw i64 %86, 48
  %88 = or i64 %83, %87
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 7
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !11
  %91 = zext i8 %90 to i64
  %92 = shl nuw i64 %91, 56
  %93 = or i64 %88, %92
  %94 = add nsw i32 %51, -8
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 8
  br label %109

96:                                               ; preds = %54, %96
  %97 = phi i32 [ %107, %96 ], [ 0, %54 ]
  %98 = phi i64 [ %106, %96 ], [ 0, %54 ]
  %99 = zext i32 %97 to i64
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 %99
  %101 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !11
  %102 = zext i8 %101 to i64
  %103 = shl i32 %97, 3
  %104 = zext i32 %103 to i64
  %105 = shl nuw i64 %102, %104
  %106 = or i64 %105, %98
  %107 = add nuw nsw i32 %97, 1
  %108 = icmp eq i32 %107, %51
  br i1 %108, label %109, label %96, !llvm.loop !12

109:                                              ; preds = %96, %56, %54
  %110 = phi i8 addrspace(4)* [ %95, %56 ], [ %43, %54 ], [ %43, %96 ]
  %111 = phi i32 [ %94, %56 ], [ 0, %54 ], [ 0, %96 ]
  %112 = phi i64 [ %93, %56 ], [ 0, %54 ], [ %106, %96 ]
  %113 = icmp ugt i32 %111, 7
  br i1 %113, label %116, label %114

114:                                              ; preds = %109
  %115 = icmp eq i32 %111, 0
  br i1 %115, label %169, label %156

116:                                              ; preds = %109
  %117 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !11
  %118 = zext i8 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 1
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !11
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 8
  %123 = or i64 %122, %118
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 2
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !11
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 16
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 3
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !11
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 24
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 4
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !11
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 32
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 5
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !11
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 40
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 6
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !11
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 48
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 7
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !11
  %151 = zext i8 %150 to i64
  %152 = shl nuw i64 %151, 56
  %153 = or i64 %148, %152
  %154 = add nsw i32 %111, -8
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 8
  br label %169

156:                                              ; preds = %114, %156
  %157 = phi i32 [ %167, %156 ], [ 0, %114 ]
  %158 = phi i64 [ %166, %156 ], [ 0, %114 ]
  %159 = zext i32 %157 to i64
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 %159
  %161 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !11
  %162 = zext i8 %161 to i64
  %163 = shl i32 %157, 3
  %164 = zext i32 %163 to i64
  %165 = shl nuw i64 %162, %164
  %166 = or i64 %165, %158
  %167 = add nuw nsw i32 %157, 1
  %168 = icmp eq i32 %167, %111
  br i1 %168, label %169, label %156

169:                                              ; preds = %156, %116, %114
  %170 = phi i8 addrspace(4)* [ %155, %116 ], [ %110, %114 ], [ %110, %156 ]
  %171 = phi i32 [ %154, %116 ], [ 0, %114 ], [ 0, %156 ]
  %172 = phi i64 [ %153, %116 ], [ 0, %114 ], [ %166, %156 ]
  %173 = icmp ugt i32 %171, 7
  br i1 %173, label %176, label %174

174:                                              ; preds = %169
  %175 = icmp eq i32 %171, 0
  br i1 %175, label %229, label %216

176:                                              ; preds = %169
  %177 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !11
  %178 = zext i8 %177 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 1
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !11
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 8
  %183 = or i64 %182, %178
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 2
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !11
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 16
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 3
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !11
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 24
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 4
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !11
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 32
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 5
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !11
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 40
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 6
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !11
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 48
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 7
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !11
  %211 = zext i8 %210 to i64
  %212 = shl nuw i64 %211, 56
  %213 = or i64 %208, %212
  %214 = add nsw i32 %171, -8
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 8
  br label %229

216:                                              ; preds = %174, %216
  %217 = phi i32 [ %227, %216 ], [ 0, %174 ]
  %218 = phi i64 [ %226, %216 ], [ 0, %174 ]
  %219 = zext i32 %217 to i64
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 %219
  %221 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !11
  %222 = zext i8 %221 to i64
  %223 = shl i32 %217, 3
  %224 = zext i32 %223 to i64
  %225 = shl nuw i64 %222, %224
  %226 = or i64 %225, %218
  %227 = add nuw nsw i32 %217, 1
  %228 = icmp eq i32 %227, %171
  br i1 %228, label %229, label %216

229:                                              ; preds = %216, %176, %174
  %230 = phi i8 addrspace(4)* [ %215, %176 ], [ %170, %174 ], [ %170, %216 ]
  %231 = phi i32 [ %214, %176 ], [ 0, %174 ], [ 0, %216 ]
  %232 = phi i64 [ %213, %176 ], [ 0, %174 ], [ %226, %216 ]
  %233 = icmp ugt i32 %231, 7
  br i1 %233, label %236, label %234

234:                                              ; preds = %229
  %235 = icmp eq i32 %231, 0
  br i1 %235, label %289, label %276

236:                                              ; preds = %229
  %237 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !11
  %238 = zext i8 %237 to i64
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 1
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !11
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 8
  %243 = or i64 %242, %238
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 2
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !11
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 16
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 3
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !11
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 24
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 4
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !11
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 32
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 5
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !11
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 40
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 6
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !11
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 48
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 7
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !11
  %271 = zext i8 %270 to i64
  %272 = shl nuw i64 %271, 56
  %273 = or i64 %268, %272
  %274 = add nsw i32 %231, -8
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 8
  br label %289

276:                                              ; preds = %234, %276
  %277 = phi i32 [ %287, %276 ], [ 0, %234 ]
  %278 = phi i64 [ %286, %276 ], [ 0, %234 ]
  %279 = zext i32 %277 to i64
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 %279
  %281 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !11
  %282 = zext i8 %281 to i64
  %283 = shl i32 %277, 3
  %284 = zext i32 %283 to i64
  %285 = shl nuw i64 %282, %284
  %286 = or i64 %285, %278
  %287 = add nuw nsw i32 %277, 1
  %288 = icmp eq i32 %287, %231
  br i1 %288, label %289, label %276

289:                                              ; preds = %276, %236, %234
  %290 = phi i8 addrspace(4)* [ %275, %236 ], [ %230, %234 ], [ %230, %276 ]
  %291 = phi i32 [ %274, %236 ], [ 0, %234 ], [ 0, %276 ]
  %292 = phi i64 [ %273, %236 ], [ 0, %234 ], [ %286, %276 ]
  %293 = icmp ugt i32 %291, 7
  br i1 %293, label %296, label %294

294:                                              ; preds = %289
  %295 = icmp eq i32 %291, 0
  br i1 %295, label %349, label %336

296:                                              ; preds = %289
  %297 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !11
  %298 = zext i8 %297 to i64
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 1
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !11
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 8
  %303 = or i64 %302, %298
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 2
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !11
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 16
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 3
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !11
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 24
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 4
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !11
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 32
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 5
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !11
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 40
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 6
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !11
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 48
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 7
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !11
  %331 = zext i8 %330 to i64
  %332 = shl nuw i64 %331, 56
  %333 = or i64 %328, %332
  %334 = add nsw i32 %291, -8
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 8
  br label %349

336:                                              ; preds = %294, %336
  %337 = phi i32 [ %347, %336 ], [ 0, %294 ]
  %338 = phi i64 [ %346, %336 ], [ 0, %294 ]
  %339 = zext i32 %337 to i64
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 %339
  %341 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !11
  %342 = zext i8 %341 to i64
  %343 = shl i32 %337, 3
  %344 = zext i32 %343 to i64
  %345 = shl nuw i64 %342, %344
  %346 = or i64 %345, %338
  %347 = add nuw nsw i32 %337, 1
  %348 = icmp eq i32 %347, %291
  br i1 %348, label %349, label %336

349:                                              ; preds = %336, %296, %294
  %350 = phi i8 addrspace(4)* [ %335, %296 ], [ %290, %294 ], [ %290, %336 ]
  %351 = phi i32 [ %334, %296 ], [ 0, %294 ], [ 0, %336 ]
  %352 = phi i64 [ %333, %296 ], [ 0, %294 ], [ %346, %336 ]
  %353 = icmp ugt i32 %351, 7
  br i1 %353, label %356, label %354

354:                                              ; preds = %349
  %355 = icmp eq i32 %351, 0
  br i1 %355, label %409, label %396

356:                                              ; preds = %349
  %357 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !11
  %358 = zext i8 %357 to i64
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 1
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !11
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 8
  %363 = or i64 %362, %358
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 2
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !11
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 16
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 3
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !11
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 24
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 4
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !11
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 32
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 5
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !11
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 40
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 6
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !11
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 48
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 7
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !11
  %391 = zext i8 %390 to i64
  %392 = shl nuw i64 %391, 56
  %393 = or i64 %388, %392
  %394 = add nsw i32 %351, -8
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 8
  br label %409

396:                                              ; preds = %354, %396
  %397 = phi i32 [ %407, %396 ], [ 0, %354 ]
  %398 = phi i64 [ %406, %396 ], [ 0, %354 ]
  %399 = zext i32 %397 to i64
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 %399
  %401 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !11
  %402 = zext i8 %401 to i64
  %403 = shl i32 %397, 3
  %404 = zext i32 %403 to i64
  %405 = shl nuw i64 %402, %404
  %406 = or i64 %405, %398
  %407 = add nuw nsw i32 %397, 1
  %408 = icmp eq i32 %407, %351
  br i1 %408, label %409, label %396

409:                                              ; preds = %396, %356, %354
  %410 = phi i8 addrspace(4)* [ %395, %356 ], [ %350, %354 ], [ %350, %396 ]
  %411 = phi i32 [ %394, %356 ], [ 0, %354 ], [ 0, %396 ]
  %412 = phi i64 [ %393, %356 ], [ 0, %354 ], [ %406, %396 ]
  %413 = icmp ugt i32 %411, 7
  br i1 %413, label %416, label %414

414:                                              ; preds = %409
  %415 = icmp eq i32 %411, 0
  br i1 %415, label %467, label %454

416:                                              ; preds = %409
  %417 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !11
  %418 = zext i8 %417 to i64
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 1
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !11
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 8
  %423 = or i64 %422, %418
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 2
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !11
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 16
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 3
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !11
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 24
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 4
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !11
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 32
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 5
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !11
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 40
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 6
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !11
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 48
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 7
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !11
  %451 = zext i8 %450 to i64
  %452 = shl nuw i64 %451, 56
  %453 = or i64 %448, %452
  br label %467

454:                                              ; preds = %414, %454
  %455 = phi i32 [ %465, %454 ], [ 0, %414 ]
  %456 = phi i64 [ %464, %454 ], [ 0, %414 ]
  %457 = zext i32 %455 to i64
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 %457
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !11
  %460 = zext i8 %459 to i64
  %461 = shl i32 %455, 3
  %462 = zext i32 %461 to i64
  %463 = shl nuw i64 %460, %462
  %464 = or i64 %463, %456
  %465 = add nuw nsw i32 %455, 1
  %466 = icmp eq i32 %465, %411
  br i1 %466, label %467, label %454

467:                                              ; preds = %454, %416, %414
  %468 = phi i64 [ %453, %416 ], [ 0, %414 ], [ %464, %454 ]
  %469 = shl nuw nsw i64 %50, 2
  %470 = add nuw nsw i64 %469, 28
  %471 = and i64 %470, 480
  %472 = and i64 %52, -225
  %473 = or i64 %472, %471
  %474 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i32 noundef 2, i64 noundef %473, i64 noundef %112, i64 noundef %172, i64 noundef %232, i64 noundef %292, i64 noundef %352, i64 noundef %412, i64 noundef %468) #13
  %475 = sub i64 %42, %50
  %476 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 %50
  %477 = icmp eq i64 %475, 0
  br i1 %477, label %478, label %41

478:                                              ; preds = %467, %33
  %479 = phi <2 x i64> [ %36, %33 ], [ %474, %467 ]
  %480 = extractelement <2 x i64> %479, i64 0
  %481 = bitcast double %24 to i64
  %482 = and i64 %480, -227
  %483 = or i64 %482, 34
  %484 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i32 noundef 2, i64 noundef %483, i64 noundef %481, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  br label %485

485:                                              ; preds = %478, %7
  %486 = icmp sgt i32 %5, 0
  br i1 %486, label %487, label %1282

487:                                              ; preds = %485
  %488 = add i32 %5, -1
  %489 = and i32 %5, 7
  %490 = icmp ult i32 %488, 7
  br i1 %490, label %493, label %491

491:                                              ; preds = %487
  %492 = and i32 %5, -8
  br label %505

493:                                              ; preds = %505, %487
  %494 = phi i32 [ 0, %487 ], [ %531, %505 ]
  %495 = icmp eq i32 %489, 0
  br i1 %495, label %504, label %496

496:                                              ; preds = %493, %496
  %497 = phi i32 [ %501, %496 ], [ %494, %493 ]
  %498 = phi i32 [ %502, %496 ], [ 0, %493 ]
  %499 = zext i32 %497 to i64
  %500 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %499
  store i32 0, i32 addrspace(1)* %500, align 4, !tbaa !14
  %501 = add nuw nsw i32 %497, 1
  %502 = add i32 %498, 1
  %503 = icmp eq i32 %502, %489
  br i1 %503, label %504, label %496, !llvm.loop !18

504:                                              ; preds = %496, %493
  br i1 %486, label %534, label %1282

505:                                              ; preds = %505, %491
  %506 = phi i32 [ 0, %491 ], [ %531, %505 ]
  %507 = phi i32 [ 0, %491 ], [ %532, %505 ]
  %508 = zext i32 %506 to i64
  %509 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %508
  store i32 0, i32 addrspace(1)* %509, align 4, !tbaa !14
  %510 = or i32 %506, 1
  %511 = zext i32 %510 to i64
  %512 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %511
  store i32 0, i32 addrspace(1)* %512, align 4, !tbaa !14
  %513 = or i32 %506, 2
  %514 = zext i32 %513 to i64
  %515 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %514
  store i32 0, i32 addrspace(1)* %515, align 4, !tbaa !14
  %516 = or i32 %506, 3
  %517 = zext i32 %516 to i64
  %518 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %517
  store i32 0, i32 addrspace(1)* %518, align 4, !tbaa !14
  %519 = or i32 %506, 4
  %520 = zext i32 %519 to i64
  %521 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %520
  store i32 0, i32 addrspace(1)* %521, align 4, !tbaa !14
  %522 = or i32 %506, 5
  %523 = zext i32 %522 to i64
  %524 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %523
  store i32 0, i32 addrspace(1)* %524, align 4, !tbaa !14
  %525 = or i32 %506, 6
  %526 = zext i32 %525 to i64
  %527 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %526
  store i32 0, i32 addrspace(1)* %527, align 4, !tbaa !14
  %528 = or i32 %506, 7
  %529 = zext i32 %528 to i64
  %530 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %529
  store i32 0, i32 addrspace(1)* %530, align 4, !tbaa !14
  %531 = add nuw nsw i32 %506, 8
  %532 = add i32 %507, 8
  %533 = icmp eq i32 %532, %492
  br i1 %533, label %493, label %505, !llvm.loop !19

534:                                              ; preds = %504
  %535 = sext i32 %17 to i64
  %536 = icmp ult i64 %535, %2
  %537 = getelementptr inbounds float, float addrspace(1)* %1, i64 %535
  br label %538

538:                                              ; preds = %534, %554
  %539 = phi i32 [ 0, %534 ], [ %555, %554 ]
  br i1 %536, label %542, label %540

540:                                              ; preds = %538
  %541 = add nuw nsw i32 %539, 1
  br label %554

542:                                              ; preds = %538
  %543 = load float, float addrspace(1)* %537, align 4, !tbaa !21
  %544 = add nuw nsw i32 %539, 1
  %545 = sitofp i32 %544 to float
  %546 = fmul contract float %545, %3
  %547 = fadd contract float %546, %4
  %548 = fcmp contract ugt float %543, %547
  br i1 %548, label %554, label %549

549:                                              ; preds = %542
  %550 = zext i32 %539 to i64
  %551 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %550
  %552 = load i32, i32 addrspace(1)* %551, align 4, !tbaa !14
  %553 = add nsw i32 %552, 1
  store i32 %553, i32 addrspace(1)* %551, align 4, !tbaa !14
  br label %557

554:                                              ; preds = %540, %542
  %555 = phi i32 [ %541, %540 ], [ %544, %542 ]
  %556 = icmp eq i32 %555, %5
  br i1 %556, label %557, label %538, !llvm.loop !23

557:                                              ; preds = %554, %549
  br i1 %486, label %558, label %1282

558:                                              ; preds = %557
  %559 = or i32 %17, 1
  %560 = sext i32 %559 to i64
  %561 = icmp ult i64 %560, %2
  %562 = getelementptr inbounds float, float addrspace(1)* %1, i64 %560
  br label %563

563:                                              ; preds = %579, %558
  %564 = phi i32 [ 0, %558 ], [ %580, %579 ]
  br i1 %561, label %567, label %565

565:                                              ; preds = %563
  %566 = add nuw nsw i32 %564, 1
  br label %579

567:                                              ; preds = %563
  %568 = load float, float addrspace(1)* %562, align 4, !tbaa !21
  %569 = add nuw nsw i32 %564, 1
  %570 = sitofp i32 %569 to float
  %571 = fmul contract float %570, %3
  %572 = fadd contract float %571, %4
  %573 = fcmp contract ugt float %568, %572
  br i1 %573, label %579, label %574

574:                                              ; preds = %567
  %575 = zext i32 %564 to i64
  %576 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %575
  %577 = load i32, i32 addrspace(1)* %576, align 4, !tbaa !14
  %578 = add nsw i32 %577, 1
  store i32 %578, i32 addrspace(1)* %576, align 4, !tbaa !14
  br label %582

579:                                              ; preds = %565, %567
  %580 = phi i32 [ %566, %565 ], [ %569, %567 ]
  %581 = icmp eq i32 %580, %5
  br i1 %581, label %582, label %563, !llvm.loop !23

582:                                              ; preds = %579, %574
  br i1 %486, label %583, label %1282

583:                                              ; preds = %582
  %584 = add nsw i32 %17, 2
  %585 = sext i32 %584 to i64
  %586 = icmp ult i64 %585, %2
  %587 = getelementptr inbounds float, float addrspace(1)* %1, i64 %585
  br label %588

588:                                              ; preds = %604, %583
  %589 = phi i32 [ 0, %583 ], [ %605, %604 ]
  br i1 %586, label %592, label %590

590:                                              ; preds = %588
  %591 = add nuw nsw i32 %589, 1
  br label %604

592:                                              ; preds = %588
  %593 = load float, float addrspace(1)* %587, align 4, !tbaa !21
  %594 = add nuw nsw i32 %589, 1
  %595 = sitofp i32 %594 to float
  %596 = fmul contract float %595, %3
  %597 = fadd contract float %596, %4
  %598 = fcmp contract ugt float %593, %597
  br i1 %598, label %604, label %599

599:                                              ; preds = %592
  %600 = zext i32 %589 to i64
  %601 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %600
  %602 = load i32, i32 addrspace(1)* %601, align 4, !tbaa !14
  %603 = add nsw i32 %602, 1
  store i32 %603, i32 addrspace(1)* %601, align 4, !tbaa !14
  br label %607

604:                                              ; preds = %590, %592
  %605 = phi i32 [ %591, %590 ], [ %594, %592 ]
  %606 = icmp eq i32 %605, %5
  br i1 %606, label %607, label %588, !llvm.loop !23

607:                                              ; preds = %604, %599
  br i1 %486, label %608, label %1282

608:                                              ; preds = %607
  %609 = add nsw i32 %17, 3
  %610 = sext i32 %609 to i64
  %611 = icmp ult i64 %610, %2
  %612 = getelementptr inbounds float, float addrspace(1)* %1, i64 %610
  br label %613

613:                                              ; preds = %629, %608
  %614 = phi i32 [ 0, %608 ], [ %630, %629 ]
  br i1 %611, label %617, label %615

615:                                              ; preds = %613
  %616 = add nuw nsw i32 %614, 1
  br label %629

617:                                              ; preds = %613
  %618 = load float, float addrspace(1)* %612, align 4, !tbaa !21
  %619 = add nuw nsw i32 %614, 1
  %620 = sitofp i32 %619 to float
  %621 = fmul contract float %620, %3
  %622 = fadd contract float %621, %4
  %623 = fcmp contract ugt float %618, %622
  br i1 %623, label %629, label %624

624:                                              ; preds = %617
  %625 = zext i32 %614 to i64
  %626 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %625
  %627 = load i32, i32 addrspace(1)* %626, align 4, !tbaa !14
  %628 = add nsw i32 %627, 1
  store i32 %628, i32 addrspace(1)* %626, align 4, !tbaa !14
  br label %632

629:                                              ; preds = %615, %617
  %630 = phi i32 [ %616, %615 ], [ %619, %617 ]
  %631 = icmp eq i32 %630, %5
  br i1 %631, label %632, label %613, !llvm.loop !23

632:                                              ; preds = %629, %624
  br i1 %486, label %633, label %1282

633:                                              ; preds = %632
  %634 = add nsw i32 %17, 4
  %635 = sext i32 %634 to i64
  %636 = icmp ult i64 %635, %2
  %637 = getelementptr inbounds float, float addrspace(1)* %1, i64 %635
  br label %638

638:                                              ; preds = %654, %633
  %639 = phi i32 [ 0, %633 ], [ %655, %654 ]
  br i1 %636, label %642, label %640

640:                                              ; preds = %638
  %641 = add nuw nsw i32 %639, 1
  br label %654

642:                                              ; preds = %638
  %643 = load float, float addrspace(1)* %637, align 4, !tbaa !21
  %644 = add nuw nsw i32 %639, 1
  %645 = sitofp i32 %644 to float
  %646 = fmul contract float %645, %3
  %647 = fadd contract float %646, %4
  %648 = fcmp contract ugt float %643, %647
  br i1 %648, label %654, label %649

649:                                              ; preds = %642
  %650 = zext i32 %639 to i64
  %651 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %650
  %652 = load i32, i32 addrspace(1)* %651, align 4, !tbaa !14
  %653 = add nsw i32 %652, 1
  store i32 %653, i32 addrspace(1)* %651, align 4, !tbaa !14
  br label %657

654:                                              ; preds = %640, %642
  %655 = phi i32 [ %641, %640 ], [ %644, %642 ]
  %656 = icmp eq i32 %655, %5
  br i1 %656, label %657, label %638, !llvm.loop !23

657:                                              ; preds = %654, %649
  br i1 %486, label %658, label %1282

658:                                              ; preds = %657
  %659 = add nsw i32 %17, 5
  %660 = sext i32 %659 to i64
  %661 = icmp ult i64 %660, %2
  %662 = getelementptr inbounds float, float addrspace(1)* %1, i64 %660
  br label %663

663:                                              ; preds = %679, %658
  %664 = phi i32 [ 0, %658 ], [ %680, %679 ]
  br i1 %661, label %667, label %665

665:                                              ; preds = %663
  %666 = add nuw nsw i32 %664, 1
  br label %679

667:                                              ; preds = %663
  %668 = load float, float addrspace(1)* %662, align 4, !tbaa !21
  %669 = add nuw nsw i32 %664, 1
  %670 = sitofp i32 %669 to float
  %671 = fmul contract float %670, %3
  %672 = fadd contract float %671, %4
  %673 = fcmp contract ugt float %668, %672
  br i1 %673, label %679, label %674

674:                                              ; preds = %667
  %675 = zext i32 %664 to i64
  %676 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %675
  %677 = load i32, i32 addrspace(1)* %676, align 4, !tbaa !14
  %678 = add nsw i32 %677, 1
  store i32 %678, i32 addrspace(1)* %676, align 4, !tbaa !14
  br label %682

679:                                              ; preds = %665, %667
  %680 = phi i32 [ %666, %665 ], [ %669, %667 ]
  %681 = icmp eq i32 %680, %5
  br i1 %681, label %682, label %663, !llvm.loop !23

682:                                              ; preds = %679, %674
  br i1 %486, label %683, label %1282

683:                                              ; preds = %682
  %684 = add nsw i32 %17, 6
  %685 = sext i32 %684 to i64
  %686 = icmp ult i64 %685, %2
  %687 = getelementptr inbounds float, float addrspace(1)* %1, i64 %685
  br label %688

688:                                              ; preds = %704, %683
  %689 = phi i32 [ 0, %683 ], [ %705, %704 ]
  br i1 %686, label %692, label %690

690:                                              ; preds = %688
  %691 = add nuw nsw i32 %689, 1
  br label %704

692:                                              ; preds = %688
  %693 = load float, float addrspace(1)* %687, align 4, !tbaa !21
  %694 = add nuw nsw i32 %689, 1
  %695 = sitofp i32 %694 to float
  %696 = fmul contract float %695, %3
  %697 = fadd contract float %696, %4
  %698 = fcmp contract ugt float %693, %697
  br i1 %698, label %704, label %699

699:                                              ; preds = %692
  %700 = zext i32 %689 to i64
  %701 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %700
  %702 = load i32, i32 addrspace(1)* %701, align 4, !tbaa !14
  %703 = add nsw i32 %702, 1
  store i32 %703, i32 addrspace(1)* %701, align 4, !tbaa !14
  br label %707

704:                                              ; preds = %690, %692
  %705 = phi i32 [ %691, %690 ], [ %694, %692 ]
  %706 = icmp eq i32 %705, %5
  br i1 %706, label %707, label %688, !llvm.loop !23

707:                                              ; preds = %704, %699
  br i1 %486, label %708, label %1282

708:                                              ; preds = %707
  %709 = add nsw i32 %17, 7
  %710 = sext i32 %709 to i64
  %711 = icmp ult i64 %710, %2
  %712 = getelementptr inbounds float, float addrspace(1)* %1, i64 %710
  br label %713

713:                                              ; preds = %729, %708
  %714 = phi i32 [ 0, %708 ], [ %730, %729 ]
  br i1 %711, label %717, label %715

715:                                              ; preds = %713
  %716 = add nuw nsw i32 %714, 1
  br label %729

717:                                              ; preds = %713
  %718 = load float, float addrspace(1)* %712, align 4, !tbaa !21
  %719 = add nuw nsw i32 %714, 1
  %720 = sitofp i32 %719 to float
  %721 = fmul contract float %720, %3
  %722 = fadd contract float %721, %4
  %723 = fcmp contract ugt float %718, %722
  br i1 %723, label %729, label %724

724:                                              ; preds = %717
  %725 = zext i32 %714 to i64
  %726 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %725
  %727 = load i32, i32 addrspace(1)* %726, align 4, !tbaa !14
  %728 = add nsw i32 %727, 1
  store i32 %728, i32 addrspace(1)* %726, align 4, !tbaa !14
  br label %732

729:                                              ; preds = %715, %717
  %730 = phi i32 [ %716, %715 ], [ %719, %717 ]
  %731 = icmp eq i32 %730, %5
  br i1 %731, label %732, label %713, !llvm.loop !23

732:                                              ; preds = %729, %724
  br i1 %486, label %733, label %1282

733:                                              ; preds = %732
  %734 = add nsw i32 %17, 8
  %735 = sext i32 %734 to i64
  %736 = icmp ult i64 %735, %2
  %737 = getelementptr inbounds float, float addrspace(1)* %1, i64 %735
  br label %738

738:                                              ; preds = %754, %733
  %739 = phi i32 [ 0, %733 ], [ %755, %754 ]
  br i1 %736, label %742, label %740

740:                                              ; preds = %738
  %741 = add nuw nsw i32 %739, 1
  br label %754

742:                                              ; preds = %738
  %743 = load float, float addrspace(1)* %737, align 4, !tbaa !21
  %744 = add nuw nsw i32 %739, 1
  %745 = sitofp i32 %744 to float
  %746 = fmul contract float %745, %3
  %747 = fadd contract float %746, %4
  %748 = fcmp contract ugt float %743, %747
  br i1 %748, label %754, label %749

749:                                              ; preds = %742
  %750 = zext i32 %739 to i64
  %751 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %750
  %752 = load i32, i32 addrspace(1)* %751, align 4, !tbaa !14
  %753 = add nsw i32 %752, 1
  store i32 %753, i32 addrspace(1)* %751, align 4, !tbaa !14
  br label %757

754:                                              ; preds = %740, %742
  %755 = phi i32 [ %741, %740 ], [ %744, %742 ]
  %756 = icmp eq i32 %755, %5
  br i1 %756, label %757, label %738, !llvm.loop !23

757:                                              ; preds = %754, %749
  br i1 %486, label %758, label %1282

758:                                              ; preds = %757
  %759 = add nsw i32 %17, 9
  %760 = sext i32 %759 to i64
  %761 = icmp ult i64 %760, %2
  %762 = getelementptr inbounds float, float addrspace(1)* %1, i64 %760
  br label %763

763:                                              ; preds = %779, %758
  %764 = phi i32 [ 0, %758 ], [ %780, %779 ]
  br i1 %761, label %767, label %765

765:                                              ; preds = %763
  %766 = add nuw nsw i32 %764, 1
  br label %779

767:                                              ; preds = %763
  %768 = load float, float addrspace(1)* %762, align 4, !tbaa !21
  %769 = add nuw nsw i32 %764, 1
  %770 = sitofp i32 %769 to float
  %771 = fmul contract float %770, %3
  %772 = fadd contract float %771, %4
  %773 = fcmp contract ugt float %768, %772
  br i1 %773, label %779, label %774

774:                                              ; preds = %767
  %775 = zext i32 %764 to i64
  %776 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %775
  %777 = load i32, i32 addrspace(1)* %776, align 4, !tbaa !14
  %778 = add nsw i32 %777, 1
  store i32 %778, i32 addrspace(1)* %776, align 4, !tbaa !14
  br label %782

779:                                              ; preds = %765, %767
  %780 = phi i32 [ %766, %765 ], [ %769, %767 ]
  %781 = icmp eq i32 %780, %5
  br i1 %781, label %782, label %763, !llvm.loop !23

782:                                              ; preds = %779, %774
  br i1 %486, label %783, label %1282

783:                                              ; preds = %782
  %784 = add nsw i32 %17, 10
  %785 = sext i32 %784 to i64
  %786 = icmp ult i64 %785, %2
  %787 = getelementptr inbounds float, float addrspace(1)* %1, i64 %785
  br label %788

788:                                              ; preds = %804, %783
  %789 = phi i32 [ 0, %783 ], [ %805, %804 ]
  br i1 %786, label %792, label %790

790:                                              ; preds = %788
  %791 = add nuw nsw i32 %789, 1
  br label %804

792:                                              ; preds = %788
  %793 = load float, float addrspace(1)* %787, align 4, !tbaa !21
  %794 = add nuw nsw i32 %789, 1
  %795 = sitofp i32 %794 to float
  %796 = fmul contract float %795, %3
  %797 = fadd contract float %796, %4
  %798 = fcmp contract ugt float %793, %797
  br i1 %798, label %804, label %799

799:                                              ; preds = %792
  %800 = zext i32 %789 to i64
  %801 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %800
  %802 = load i32, i32 addrspace(1)* %801, align 4, !tbaa !14
  %803 = add nsw i32 %802, 1
  store i32 %803, i32 addrspace(1)* %801, align 4, !tbaa !14
  br label %807

804:                                              ; preds = %790, %792
  %805 = phi i32 [ %791, %790 ], [ %794, %792 ]
  %806 = icmp eq i32 %805, %5
  br i1 %806, label %807, label %788, !llvm.loop !23

807:                                              ; preds = %804, %799
  br i1 %486, label %808, label %1282

808:                                              ; preds = %807
  %809 = add nsw i32 %17, 11
  %810 = sext i32 %809 to i64
  %811 = icmp ult i64 %810, %2
  %812 = getelementptr inbounds float, float addrspace(1)* %1, i64 %810
  br label %813

813:                                              ; preds = %829, %808
  %814 = phi i32 [ 0, %808 ], [ %830, %829 ]
  br i1 %811, label %817, label %815

815:                                              ; preds = %813
  %816 = add nuw nsw i32 %814, 1
  br label %829

817:                                              ; preds = %813
  %818 = load float, float addrspace(1)* %812, align 4, !tbaa !21
  %819 = add nuw nsw i32 %814, 1
  %820 = sitofp i32 %819 to float
  %821 = fmul contract float %820, %3
  %822 = fadd contract float %821, %4
  %823 = fcmp contract ugt float %818, %822
  br i1 %823, label %829, label %824

824:                                              ; preds = %817
  %825 = zext i32 %814 to i64
  %826 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %825
  %827 = load i32, i32 addrspace(1)* %826, align 4, !tbaa !14
  %828 = add nsw i32 %827, 1
  store i32 %828, i32 addrspace(1)* %826, align 4, !tbaa !14
  br label %832

829:                                              ; preds = %815, %817
  %830 = phi i32 [ %816, %815 ], [ %819, %817 ]
  %831 = icmp eq i32 %830, %5
  br i1 %831, label %832, label %813, !llvm.loop !23

832:                                              ; preds = %829, %824
  br i1 %486, label %833, label %1282

833:                                              ; preds = %832
  %834 = add nsw i32 %17, 12
  %835 = sext i32 %834 to i64
  %836 = icmp ult i64 %835, %2
  %837 = getelementptr inbounds float, float addrspace(1)* %1, i64 %835
  br label %838

838:                                              ; preds = %854, %833
  %839 = phi i32 [ 0, %833 ], [ %855, %854 ]
  br i1 %836, label %842, label %840

840:                                              ; preds = %838
  %841 = add nuw nsw i32 %839, 1
  br label %854

842:                                              ; preds = %838
  %843 = load float, float addrspace(1)* %837, align 4, !tbaa !21
  %844 = add nuw nsw i32 %839, 1
  %845 = sitofp i32 %844 to float
  %846 = fmul contract float %845, %3
  %847 = fadd contract float %846, %4
  %848 = fcmp contract ugt float %843, %847
  br i1 %848, label %854, label %849

849:                                              ; preds = %842
  %850 = zext i32 %839 to i64
  %851 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %850
  %852 = load i32, i32 addrspace(1)* %851, align 4, !tbaa !14
  %853 = add nsw i32 %852, 1
  store i32 %853, i32 addrspace(1)* %851, align 4, !tbaa !14
  br label %857

854:                                              ; preds = %840, %842
  %855 = phi i32 [ %841, %840 ], [ %844, %842 ]
  %856 = icmp eq i32 %855, %5
  br i1 %856, label %857, label %838, !llvm.loop !23

857:                                              ; preds = %854, %849
  br i1 %486, label %858, label %1282

858:                                              ; preds = %857
  %859 = add nsw i32 %17, 13
  %860 = sext i32 %859 to i64
  %861 = icmp ult i64 %860, %2
  %862 = getelementptr inbounds float, float addrspace(1)* %1, i64 %860
  br label %863

863:                                              ; preds = %879, %858
  %864 = phi i32 [ 0, %858 ], [ %880, %879 ]
  br i1 %861, label %867, label %865

865:                                              ; preds = %863
  %866 = add nuw nsw i32 %864, 1
  br label %879

867:                                              ; preds = %863
  %868 = load float, float addrspace(1)* %862, align 4, !tbaa !21
  %869 = add nuw nsw i32 %864, 1
  %870 = sitofp i32 %869 to float
  %871 = fmul contract float %870, %3
  %872 = fadd contract float %871, %4
  %873 = fcmp contract ugt float %868, %872
  br i1 %873, label %879, label %874

874:                                              ; preds = %867
  %875 = zext i32 %864 to i64
  %876 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %875
  %877 = load i32, i32 addrspace(1)* %876, align 4, !tbaa !14
  %878 = add nsw i32 %877, 1
  store i32 %878, i32 addrspace(1)* %876, align 4, !tbaa !14
  br label %882

879:                                              ; preds = %865, %867
  %880 = phi i32 [ %866, %865 ], [ %869, %867 ]
  %881 = icmp eq i32 %880, %5
  br i1 %881, label %882, label %863, !llvm.loop !23

882:                                              ; preds = %879, %874
  br i1 %486, label %883, label %1282

883:                                              ; preds = %882
  %884 = add nsw i32 %17, 14
  %885 = sext i32 %884 to i64
  %886 = icmp ult i64 %885, %2
  %887 = getelementptr inbounds float, float addrspace(1)* %1, i64 %885
  br label %888

888:                                              ; preds = %904, %883
  %889 = phi i32 [ 0, %883 ], [ %905, %904 ]
  br i1 %886, label %892, label %890

890:                                              ; preds = %888
  %891 = add nuw nsw i32 %889, 1
  br label %904

892:                                              ; preds = %888
  %893 = load float, float addrspace(1)* %887, align 4, !tbaa !21
  %894 = add nuw nsw i32 %889, 1
  %895 = sitofp i32 %894 to float
  %896 = fmul contract float %895, %3
  %897 = fadd contract float %896, %4
  %898 = fcmp contract ugt float %893, %897
  br i1 %898, label %904, label %899

899:                                              ; preds = %892
  %900 = zext i32 %889 to i64
  %901 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %900
  %902 = load i32, i32 addrspace(1)* %901, align 4, !tbaa !14
  %903 = add nsw i32 %902, 1
  store i32 %903, i32 addrspace(1)* %901, align 4, !tbaa !14
  br label %907

904:                                              ; preds = %890, %892
  %905 = phi i32 [ %891, %890 ], [ %894, %892 ]
  %906 = icmp eq i32 %905, %5
  br i1 %906, label %907, label %888, !llvm.loop !23

907:                                              ; preds = %904, %899
  br i1 %486, label %908, label %1282

908:                                              ; preds = %907
  %909 = add nsw i32 %17, 15
  %910 = sext i32 %909 to i64
  %911 = icmp ult i64 %910, %2
  %912 = getelementptr inbounds float, float addrspace(1)* %1, i64 %910
  br label %913

913:                                              ; preds = %929, %908
  %914 = phi i32 [ 0, %908 ], [ %930, %929 ]
  br i1 %911, label %917, label %915

915:                                              ; preds = %913
  %916 = add nuw nsw i32 %914, 1
  br label %929

917:                                              ; preds = %913
  %918 = load float, float addrspace(1)* %912, align 4, !tbaa !21
  %919 = add nuw nsw i32 %914, 1
  %920 = sitofp i32 %919 to float
  %921 = fmul contract float %920, %3
  %922 = fadd contract float %921, %4
  %923 = fcmp contract ugt float %918, %922
  br i1 %923, label %929, label %924

924:                                              ; preds = %917
  %925 = zext i32 %914 to i64
  %926 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %925
  %927 = load i32, i32 addrspace(1)* %926, align 4, !tbaa !14
  %928 = add nsw i32 %927, 1
  store i32 %928, i32 addrspace(1)* %926, align 4, !tbaa !14
  br label %932

929:                                              ; preds = %915, %917
  %930 = phi i32 [ %916, %915 ], [ %919, %917 ]
  %931 = icmp eq i32 %930, %5
  br i1 %931, label %932, label %913, !llvm.loop !23

932:                                              ; preds = %929, %924
  br i1 %486, label %933, label %1282

933:                                              ; preds = %932
  %934 = add nsw i32 %17, 16
  %935 = sext i32 %934 to i64
  %936 = icmp ult i64 %935, %2
  %937 = getelementptr inbounds float, float addrspace(1)* %1, i64 %935
  br label %938

938:                                              ; preds = %954, %933
  %939 = phi i32 [ 0, %933 ], [ %955, %954 ]
  br i1 %936, label %942, label %940

940:                                              ; preds = %938
  %941 = add nuw nsw i32 %939, 1
  br label %954

942:                                              ; preds = %938
  %943 = load float, float addrspace(1)* %937, align 4, !tbaa !21
  %944 = add nuw nsw i32 %939, 1
  %945 = sitofp i32 %944 to float
  %946 = fmul contract float %945, %3
  %947 = fadd contract float %946, %4
  %948 = fcmp contract ugt float %943, %947
  br i1 %948, label %954, label %949

949:                                              ; preds = %942
  %950 = zext i32 %939 to i64
  %951 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %950
  %952 = load i32, i32 addrspace(1)* %951, align 4, !tbaa !14
  %953 = add nsw i32 %952, 1
  store i32 %953, i32 addrspace(1)* %951, align 4, !tbaa !14
  br label %957

954:                                              ; preds = %940, %942
  %955 = phi i32 [ %941, %940 ], [ %944, %942 ]
  %956 = icmp eq i32 %955, %5
  br i1 %956, label %957, label %938, !llvm.loop !23

957:                                              ; preds = %954, %949
  br i1 %486, label %958, label %1282

958:                                              ; preds = %957
  %959 = add nsw i32 %17, 17
  %960 = sext i32 %959 to i64
  %961 = icmp ult i64 %960, %2
  %962 = getelementptr inbounds float, float addrspace(1)* %1, i64 %960
  br label %963

963:                                              ; preds = %979, %958
  %964 = phi i32 [ 0, %958 ], [ %980, %979 ]
  br i1 %961, label %967, label %965

965:                                              ; preds = %963
  %966 = add nuw nsw i32 %964, 1
  br label %979

967:                                              ; preds = %963
  %968 = load float, float addrspace(1)* %962, align 4, !tbaa !21
  %969 = add nuw nsw i32 %964, 1
  %970 = sitofp i32 %969 to float
  %971 = fmul contract float %970, %3
  %972 = fadd contract float %971, %4
  %973 = fcmp contract ugt float %968, %972
  br i1 %973, label %979, label %974

974:                                              ; preds = %967
  %975 = zext i32 %964 to i64
  %976 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %975
  %977 = load i32, i32 addrspace(1)* %976, align 4, !tbaa !14
  %978 = add nsw i32 %977, 1
  store i32 %978, i32 addrspace(1)* %976, align 4, !tbaa !14
  br label %982

979:                                              ; preds = %965, %967
  %980 = phi i32 [ %966, %965 ], [ %969, %967 ]
  %981 = icmp eq i32 %980, %5
  br i1 %981, label %982, label %963, !llvm.loop !23

982:                                              ; preds = %979, %974
  br i1 %486, label %983, label %1282

983:                                              ; preds = %982
  %984 = add nsw i32 %17, 18
  %985 = sext i32 %984 to i64
  %986 = icmp ult i64 %985, %2
  %987 = getelementptr inbounds float, float addrspace(1)* %1, i64 %985
  br label %988

988:                                              ; preds = %1004, %983
  %989 = phi i32 [ 0, %983 ], [ %1005, %1004 ]
  br i1 %986, label %992, label %990

990:                                              ; preds = %988
  %991 = add nuw nsw i32 %989, 1
  br label %1004

992:                                              ; preds = %988
  %993 = load float, float addrspace(1)* %987, align 4, !tbaa !21
  %994 = add nuw nsw i32 %989, 1
  %995 = sitofp i32 %994 to float
  %996 = fmul contract float %995, %3
  %997 = fadd contract float %996, %4
  %998 = fcmp contract ugt float %993, %997
  br i1 %998, label %1004, label %999

999:                                              ; preds = %992
  %1000 = zext i32 %989 to i64
  %1001 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1000
  %1002 = load i32, i32 addrspace(1)* %1001, align 4, !tbaa !14
  %1003 = add nsw i32 %1002, 1
  store i32 %1003, i32 addrspace(1)* %1001, align 4, !tbaa !14
  br label %1007

1004:                                             ; preds = %990, %992
  %1005 = phi i32 [ %991, %990 ], [ %994, %992 ]
  %1006 = icmp eq i32 %1005, %5
  br i1 %1006, label %1007, label %988, !llvm.loop !23

1007:                                             ; preds = %1004, %999
  br i1 %486, label %1008, label %1282

1008:                                             ; preds = %1007
  %1009 = add nsw i32 %17, 19
  %1010 = sext i32 %1009 to i64
  %1011 = icmp ult i64 %1010, %2
  %1012 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1010
  br label %1013

1013:                                             ; preds = %1029, %1008
  %1014 = phi i32 [ 0, %1008 ], [ %1030, %1029 ]
  br i1 %1011, label %1017, label %1015

1015:                                             ; preds = %1013
  %1016 = add nuw nsw i32 %1014, 1
  br label %1029

1017:                                             ; preds = %1013
  %1018 = load float, float addrspace(1)* %1012, align 4, !tbaa !21
  %1019 = add nuw nsw i32 %1014, 1
  %1020 = sitofp i32 %1019 to float
  %1021 = fmul contract float %1020, %3
  %1022 = fadd contract float %1021, %4
  %1023 = fcmp contract ugt float %1018, %1022
  br i1 %1023, label %1029, label %1024

1024:                                             ; preds = %1017
  %1025 = zext i32 %1014 to i64
  %1026 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1025
  %1027 = load i32, i32 addrspace(1)* %1026, align 4, !tbaa !14
  %1028 = add nsw i32 %1027, 1
  store i32 %1028, i32 addrspace(1)* %1026, align 4, !tbaa !14
  br label %1032

1029:                                             ; preds = %1015, %1017
  %1030 = phi i32 [ %1016, %1015 ], [ %1019, %1017 ]
  %1031 = icmp eq i32 %1030, %5
  br i1 %1031, label %1032, label %1013, !llvm.loop !23

1032:                                             ; preds = %1029, %1024
  br i1 %486, label %1033, label %1282

1033:                                             ; preds = %1032
  %1034 = add nsw i32 %17, 20
  %1035 = sext i32 %1034 to i64
  %1036 = icmp ult i64 %1035, %2
  %1037 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1035
  br label %1038

1038:                                             ; preds = %1054, %1033
  %1039 = phi i32 [ 0, %1033 ], [ %1055, %1054 ]
  br i1 %1036, label %1042, label %1040

1040:                                             ; preds = %1038
  %1041 = add nuw nsw i32 %1039, 1
  br label %1054

1042:                                             ; preds = %1038
  %1043 = load float, float addrspace(1)* %1037, align 4, !tbaa !21
  %1044 = add nuw nsw i32 %1039, 1
  %1045 = sitofp i32 %1044 to float
  %1046 = fmul contract float %1045, %3
  %1047 = fadd contract float %1046, %4
  %1048 = fcmp contract ugt float %1043, %1047
  br i1 %1048, label %1054, label %1049

1049:                                             ; preds = %1042
  %1050 = zext i32 %1039 to i64
  %1051 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1050
  %1052 = load i32, i32 addrspace(1)* %1051, align 4, !tbaa !14
  %1053 = add nsw i32 %1052, 1
  store i32 %1053, i32 addrspace(1)* %1051, align 4, !tbaa !14
  br label %1057

1054:                                             ; preds = %1040, %1042
  %1055 = phi i32 [ %1041, %1040 ], [ %1044, %1042 ]
  %1056 = icmp eq i32 %1055, %5
  br i1 %1056, label %1057, label %1038, !llvm.loop !23

1057:                                             ; preds = %1054, %1049
  br i1 %486, label %1058, label %1282

1058:                                             ; preds = %1057
  %1059 = add nsw i32 %17, 21
  %1060 = sext i32 %1059 to i64
  %1061 = icmp ult i64 %1060, %2
  %1062 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1060
  br label %1063

1063:                                             ; preds = %1079, %1058
  %1064 = phi i32 [ 0, %1058 ], [ %1080, %1079 ]
  br i1 %1061, label %1067, label %1065

1065:                                             ; preds = %1063
  %1066 = add nuw nsw i32 %1064, 1
  br label %1079

1067:                                             ; preds = %1063
  %1068 = load float, float addrspace(1)* %1062, align 4, !tbaa !21
  %1069 = add nuw nsw i32 %1064, 1
  %1070 = sitofp i32 %1069 to float
  %1071 = fmul contract float %1070, %3
  %1072 = fadd contract float %1071, %4
  %1073 = fcmp contract ugt float %1068, %1072
  br i1 %1073, label %1079, label %1074

1074:                                             ; preds = %1067
  %1075 = zext i32 %1064 to i64
  %1076 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1075
  %1077 = load i32, i32 addrspace(1)* %1076, align 4, !tbaa !14
  %1078 = add nsw i32 %1077, 1
  store i32 %1078, i32 addrspace(1)* %1076, align 4, !tbaa !14
  br label %1082

1079:                                             ; preds = %1065, %1067
  %1080 = phi i32 [ %1066, %1065 ], [ %1069, %1067 ]
  %1081 = icmp eq i32 %1080, %5
  br i1 %1081, label %1082, label %1063, !llvm.loop !23

1082:                                             ; preds = %1079, %1074
  br i1 %486, label %1083, label %1282

1083:                                             ; preds = %1082
  %1084 = add nsw i32 %17, 22
  %1085 = sext i32 %1084 to i64
  %1086 = icmp ult i64 %1085, %2
  %1087 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1085
  br label %1088

1088:                                             ; preds = %1104, %1083
  %1089 = phi i32 [ 0, %1083 ], [ %1105, %1104 ]
  br i1 %1086, label %1092, label %1090

1090:                                             ; preds = %1088
  %1091 = add nuw nsw i32 %1089, 1
  br label %1104

1092:                                             ; preds = %1088
  %1093 = load float, float addrspace(1)* %1087, align 4, !tbaa !21
  %1094 = add nuw nsw i32 %1089, 1
  %1095 = sitofp i32 %1094 to float
  %1096 = fmul contract float %1095, %3
  %1097 = fadd contract float %1096, %4
  %1098 = fcmp contract ugt float %1093, %1097
  br i1 %1098, label %1104, label %1099

1099:                                             ; preds = %1092
  %1100 = zext i32 %1089 to i64
  %1101 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1100
  %1102 = load i32, i32 addrspace(1)* %1101, align 4, !tbaa !14
  %1103 = add nsw i32 %1102, 1
  store i32 %1103, i32 addrspace(1)* %1101, align 4, !tbaa !14
  br label %1107

1104:                                             ; preds = %1090, %1092
  %1105 = phi i32 [ %1091, %1090 ], [ %1094, %1092 ]
  %1106 = icmp eq i32 %1105, %5
  br i1 %1106, label %1107, label %1088, !llvm.loop !23

1107:                                             ; preds = %1104, %1099
  br i1 %486, label %1108, label %1282

1108:                                             ; preds = %1107
  %1109 = add nsw i32 %17, 23
  %1110 = sext i32 %1109 to i64
  %1111 = icmp ult i64 %1110, %2
  %1112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1110
  br label %1113

1113:                                             ; preds = %1129, %1108
  %1114 = phi i32 [ 0, %1108 ], [ %1130, %1129 ]
  br i1 %1111, label %1117, label %1115

1115:                                             ; preds = %1113
  %1116 = add nuw nsw i32 %1114, 1
  br label %1129

1117:                                             ; preds = %1113
  %1118 = load float, float addrspace(1)* %1112, align 4, !tbaa !21
  %1119 = add nuw nsw i32 %1114, 1
  %1120 = sitofp i32 %1119 to float
  %1121 = fmul contract float %1120, %3
  %1122 = fadd contract float %1121, %4
  %1123 = fcmp contract ugt float %1118, %1122
  br i1 %1123, label %1129, label %1124

1124:                                             ; preds = %1117
  %1125 = zext i32 %1114 to i64
  %1126 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1125
  %1127 = load i32, i32 addrspace(1)* %1126, align 4, !tbaa !14
  %1128 = add nsw i32 %1127, 1
  store i32 %1128, i32 addrspace(1)* %1126, align 4, !tbaa !14
  br label %1132

1129:                                             ; preds = %1115, %1117
  %1130 = phi i32 [ %1116, %1115 ], [ %1119, %1117 ]
  %1131 = icmp eq i32 %1130, %5
  br i1 %1131, label %1132, label %1113, !llvm.loop !23

1132:                                             ; preds = %1129, %1124
  br i1 %486, label %1133, label %1282

1133:                                             ; preds = %1132
  %1134 = add nsw i32 %17, 24
  %1135 = sext i32 %1134 to i64
  %1136 = icmp ult i64 %1135, %2
  %1137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1135
  br label %1138

1138:                                             ; preds = %1154, %1133
  %1139 = phi i32 [ 0, %1133 ], [ %1155, %1154 ]
  br i1 %1136, label %1142, label %1140

1140:                                             ; preds = %1138
  %1141 = add nuw nsw i32 %1139, 1
  br label %1154

1142:                                             ; preds = %1138
  %1143 = load float, float addrspace(1)* %1137, align 4, !tbaa !21
  %1144 = add nuw nsw i32 %1139, 1
  %1145 = sitofp i32 %1144 to float
  %1146 = fmul contract float %1145, %3
  %1147 = fadd contract float %1146, %4
  %1148 = fcmp contract ugt float %1143, %1147
  br i1 %1148, label %1154, label %1149

1149:                                             ; preds = %1142
  %1150 = zext i32 %1139 to i64
  %1151 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1150
  %1152 = load i32, i32 addrspace(1)* %1151, align 4, !tbaa !14
  %1153 = add nsw i32 %1152, 1
  store i32 %1153, i32 addrspace(1)* %1151, align 4, !tbaa !14
  br label %1157

1154:                                             ; preds = %1140, %1142
  %1155 = phi i32 [ %1141, %1140 ], [ %1144, %1142 ]
  %1156 = icmp eq i32 %1155, %5
  br i1 %1156, label %1157, label %1138, !llvm.loop !23

1157:                                             ; preds = %1154, %1149
  br i1 %486, label %1158, label %1282

1158:                                             ; preds = %1157
  %1159 = add nsw i32 %17, 25
  %1160 = sext i32 %1159 to i64
  %1161 = icmp ult i64 %1160, %2
  %1162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1160
  br label %1163

1163:                                             ; preds = %1179, %1158
  %1164 = phi i32 [ 0, %1158 ], [ %1180, %1179 ]
  br i1 %1161, label %1167, label %1165

1165:                                             ; preds = %1163
  %1166 = add nuw nsw i32 %1164, 1
  br label %1179

1167:                                             ; preds = %1163
  %1168 = load float, float addrspace(1)* %1162, align 4, !tbaa !21
  %1169 = add nuw nsw i32 %1164, 1
  %1170 = sitofp i32 %1169 to float
  %1171 = fmul contract float %1170, %3
  %1172 = fadd contract float %1171, %4
  %1173 = fcmp contract ugt float %1168, %1172
  br i1 %1173, label %1179, label %1174

1174:                                             ; preds = %1167
  %1175 = zext i32 %1164 to i64
  %1176 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1175
  %1177 = load i32, i32 addrspace(1)* %1176, align 4, !tbaa !14
  %1178 = add nsw i32 %1177, 1
  store i32 %1178, i32 addrspace(1)* %1176, align 4, !tbaa !14
  br label %1182

1179:                                             ; preds = %1165, %1167
  %1180 = phi i32 [ %1166, %1165 ], [ %1169, %1167 ]
  %1181 = icmp eq i32 %1180, %5
  br i1 %1181, label %1182, label %1163, !llvm.loop !23

1182:                                             ; preds = %1179, %1174
  br i1 %486, label %1183, label %1282

1183:                                             ; preds = %1182
  %1184 = add nsw i32 %17, 26
  %1185 = sext i32 %1184 to i64
  %1186 = icmp ult i64 %1185, %2
  %1187 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1185
  br label %1188

1188:                                             ; preds = %1204, %1183
  %1189 = phi i32 [ 0, %1183 ], [ %1205, %1204 ]
  br i1 %1186, label %1192, label %1190

1190:                                             ; preds = %1188
  %1191 = add nuw nsw i32 %1189, 1
  br label %1204

1192:                                             ; preds = %1188
  %1193 = load float, float addrspace(1)* %1187, align 4, !tbaa !21
  %1194 = add nuw nsw i32 %1189, 1
  %1195 = sitofp i32 %1194 to float
  %1196 = fmul contract float %1195, %3
  %1197 = fadd contract float %1196, %4
  %1198 = fcmp contract ugt float %1193, %1197
  br i1 %1198, label %1204, label %1199

1199:                                             ; preds = %1192
  %1200 = zext i32 %1189 to i64
  %1201 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1200
  %1202 = load i32, i32 addrspace(1)* %1201, align 4, !tbaa !14
  %1203 = add nsw i32 %1202, 1
  store i32 %1203, i32 addrspace(1)* %1201, align 4, !tbaa !14
  br label %1207

1204:                                             ; preds = %1190, %1192
  %1205 = phi i32 [ %1191, %1190 ], [ %1194, %1192 ]
  %1206 = icmp eq i32 %1205, %5
  br i1 %1206, label %1207, label %1188, !llvm.loop !23

1207:                                             ; preds = %1204, %1199
  br i1 %486, label %1208, label %1282

1208:                                             ; preds = %1207
  %1209 = add nsw i32 %17, 27
  %1210 = sext i32 %1209 to i64
  %1211 = icmp ult i64 %1210, %2
  %1212 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1210
  br label %1213

1213:                                             ; preds = %1229, %1208
  %1214 = phi i32 [ 0, %1208 ], [ %1230, %1229 ]
  br i1 %1211, label %1217, label %1215

1215:                                             ; preds = %1213
  %1216 = add nuw nsw i32 %1214, 1
  br label %1229

1217:                                             ; preds = %1213
  %1218 = load float, float addrspace(1)* %1212, align 4, !tbaa !21
  %1219 = add nuw nsw i32 %1214, 1
  %1220 = sitofp i32 %1219 to float
  %1221 = fmul contract float %1220, %3
  %1222 = fadd contract float %1221, %4
  %1223 = fcmp contract ugt float %1218, %1222
  br i1 %1223, label %1229, label %1224

1224:                                             ; preds = %1217
  %1225 = zext i32 %1214 to i64
  %1226 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1225
  %1227 = load i32, i32 addrspace(1)* %1226, align 4, !tbaa !14
  %1228 = add nsw i32 %1227, 1
  store i32 %1228, i32 addrspace(1)* %1226, align 4, !tbaa !14
  br label %1232

1229:                                             ; preds = %1215, %1217
  %1230 = phi i32 [ %1216, %1215 ], [ %1219, %1217 ]
  %1231 = icmp eq i32 %1230, %5
  br i1 %1231, label %1232, label %1213, !llvm.loop !23

1232:                                             ; preds = %1229, %1224
  br i1 %486, label %1233, label %1282

1233:                                             ; preds = %1232
  %1234 = add nsw i32 %17, 28
  %1235 = sext i32 %1234 to i64
  %1236 = icmp ult i64 %1235, %2
  %1237 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1235
  br label %1238

1238:                                             ; preds = %1254, %1233
  %1239 = phi i32 [ 0, %1233 ], [ %1255, %1254 ]
  br i1 %1236, label %1242, label %1240

1240:                                             ; preds = %1238
  %1241 = add nuw nsw i32 %1239, 1
  br label %1254

1242:                                             ; preds = %1238
  %1243 = load float, float addrspace(1)* %1237, align 4, !tbaa !21
  %1244 = add nuw nsw i32 %1239, 1
  %1245 = sitofp i32 %1244 to float
  %1246 = fmul contract float %1245, %3
  %1247 = fadd contract float %1246, %4
  %1248 = fcmp contract ugt float %1243, %1247
  br i1 %1248, label %1254, label %1249

1249:                                             ; preds = %1242
  %1250 = zext i32 %1239 to i64
  %1251 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1250
  %1252 = load i32, i32 addrspace(1)* %1251, align 4, !tbaa !14
  %1253 = add nsw i32 %1252, 1
  store i32 %1253, i32 addrspace(1)* %1251, align 4, !tbaa !14
  br label %1257

1254:                                             ; preds = %1240, %1242
  %1255 = phi i32 [ %1241, %1240 ], [ %1244, %1242 ]
  %1256 = icmp eq i32 %1255, %5
  br i1 %1256, label %1257, label %1238, !llvm.loop !23

1257:                                             ; preds = %1254, %1249
  br i1 %486, label %1258, label %1282

1258:                                             ; preds = %1257
  %1259 = add nsw i32 %17, 29
  %1260 = sext i32 %1259 to i64
  %1261 = icmp ult i64 %1260, %2
  %1262 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1260
  br label %1263

1263:                                             ; preds = %1279, %1258
  %1264 = phi i32 [ 0, %1258 ], [ %1280, %1279 ]
  br i1 %1261, label %1267, label %1265

1265:                                             ; preds = %1263
  %1266 = add nuw nsw i32 %1264, 1
  br label %1279

1267:                                             ; preds = %1263
  %1268 = load float, float addrspace(1)* %1262, align 4, !tbaa !21
  %1269 = add nuw nsw i32 %1264, 1
  %1270 = sitofp i32 %1269 to float
  %1271 = fmul contract float %1270, %3
  %1272 = fadd contract float %1271, %4
  %1273 = fcmp contract ugt float %1268, %1272
  br i1 %1273, label %1279, label %1274

1274:                                             ; preds = %1267
  %1275 = zext i32 %1264 to i64
  %1276 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1275
  %1277 = load i32, i32 addrspace(1)* %1276, align 4, !tbaa !14
  %1278 = add nsw i32 %1277, 1
  store i32 %1278, i32 addrspace(1)* %1276, align 4, !tbaa !14
  br label %1282

1279:                                             ; preds = %1265, %1267
  %1280 = phi i32 [ %1266, %1265 ], [ %1269, %1267 ]
  %1281 = icmp eq i32 %1280, %5
  br i1 %1281, label %1282, label %1263, !llvm.loop !23

1282:                                             ; preds = %1279, %485, %504, %557, %582, %607, %632, %657, %682, %707, %732, %757, %782, %807, %832, %857, %882, %907, %932, %957, %982, %1007, %1032, %1057, %1082, %1107, %1132, %1157, %1182, %1207, %1232, %1274, %1257
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %486, label %1283, label %1304

1283:                                             ; preds = %1282
  %1284 = add i32 %5, -1
  %1285 = and i32 %5, 7
  %1286 = icmp ult i32 %1284, 7
  br i1 %1286, label %1289, label %1287

1287:                                             ; preds = %1283
  %1288 = and i32 %5, -8
  br label %1316

1289:                                             ; preds = %1316, %1283
  %1290 = phi i32 [ 0, %1283 ], [ %1374, %1316 ]
  %1291 = icmp eq i32 %1285, 0
  br i1 %1291, label %1304, label %1292

1292:                                             ; preds = %1289, %1292
  %1293 = phi i32 [ %1301, %1292 ], [ %1290, %1289 ]
  %1294 = phi i32 [ %1302, %1292 ], [ 0, %1289 ]
  %1295 = zext i32 %1293 to i64
  %1296 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1295
  %1297 = load i32, i32 addrspace(1)* %1296, align 4, !tbaa !14
  %1298 = shl nsw i32 %1293, 2
  %1299 = add nuw nsw i32 %1298, %15
  %1300 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1299
  store i32 %1297, i32 addrspace(3)* %1300, align 4, !tbaa !14
  %1301 = add nuw nsw i32 %1293, 1
  %1302 = add i32 %1294, 1
  %1303 = icmp eq i32 %1302, %1285
  br i1 %1303, label %1304, label %1292, !llvm.loop !24

1304:                                             ; preds = %1289, %1292, %1282
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1305 = zext i32 %15 to i64
  %1306 = icmp eq i32 %5, 0
  %1307 = tail call i64 @llvm.umax.i64(i64 %18, i64 1)
  %1308 = icmp ugt i32 %15, 1
  %1309 = select i1 %1308, i1 true, i1 %1306
  br i1 %1309, label %1496, label %1310

1310:                                             ; preds = %1304
  %1311 = add i64 %1307, -1
  %1312 = and i64 %1307, 7
  %1313 = icmp ult i64 %1311, 7
  br i1 %1313, label %1477, label %1314

1314:                                             ; preds = %1310
  %1315 = and i64 %1307, -8
  br label %1384

1316:                                             ; preds = %1316, %1287
  %1317 = phi i32 [ 0, %1287 ], [ %1374, %1316 ]
  %1318 = phi i32 [ 0, %1287 ], [ %1375, %1316 ]
  %1319 = zext i32 %1317 to i64
  %1320 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1319
  %1321 = load i32, i32 addrspace(1)* %1320, align 4, !tbaa !14
  %1322 = shl nsw i32 %1317, 2
  %1323 = add nuw nsw i32 %1322, %15
  %1324 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1323
  store i32 %1321, i32 addrspace(3)* %1324, align 4, !tbaa !14
  %1325 = or i32 %1317, 1
  %1326 = zext i32 %1325 to i64
  %1327 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1326
  %1328 = load i32, i32 addrspace(1)* %1327, align 4, !tbaa !14
  %1329 = shl nsw i32 %1325, 2
  %1330 = add nuw nsw i32 %1329, %15
  %1331 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1330
  store i32 %1328, i32 addrspace(3)* %1331, align 4, !tbaa !14
  %1332 = or i32 %1317, 2
  %1333 = zext i32 %1332 to i64
  %1334 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1333
  %1335 = load i32, i32 addrspace(1)* %1334, align 4, !tbaa !14
  %1336 = shl nsw i32 %1332, 2
  %1337 = add nuw nsw i32 %1336, %15
  %1338 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1337
  store i32 %1335, i32 addrspace(3)* %1338, align 4, !tbaa !14
  %1339 = or i32 %1317, 3
  %1340 = zext i32 %1339 to i64
  %1341 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1340
  %1342 = load i32, i32 addrspace(1)* %1341, align 4, !tbaa !14
  %1343 = shl nsw i32 %1339, 2
  %1344 = add nuw nsw i32 %1343, %15
  %1345 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1344
  store i32 %1342, i32 addrspace(3)* %1345, align 4, !tbaa !14
  %1346 = or i32 %1317, 4
  %1347 = zext i32 %1346 to i64
  %1348 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1347
  %1349 = load i32, i32 addrspace(1)* %1348, align 4, !tbaa !14
  %1350 = shl nsw i32 %1346, 2
  %1351 = add nuw nsw i32 %1350, %15
  %1352 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1351
  store i32 %1349, i32 addrspace(3)* %1352, align 4, !tbaa !14
  %1353 = or i32 %1317, 5
  %1354 = zext i32 %1353 to i64
  %1355 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1354
  %1356 = load i32, i32 addrspace(1)* %1355, align 4, !tbaa !14
  %1357 = shl nsw i32 %1353, 2
  %1358 = add nuw nsw i32 %1357, %15
  %1359 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1358
  store i32 %1356, i32 addrspace(3)* %1359, align 4, !tbaa !14
  %1360 = or i32 %1317, 6
  %1361 = zext i32 %1360 to i64
  %1362 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1361
  %1363 = load i32, i32 addrspace(1)* %1362, align 4, !tbaa !14
  %1364 = shl nsw i32 %1360, 2
  %1365 = add nuw nsw i32 %1364, %15
  %1366 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1365
  store i32 %1363, i32 addrspace(3)* %1366, align 4, !tbaa !14
  %1367 = or i32 %1317, 7
  %1368 = zext i32 %1367 to i64
  %1369 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %1368
  %1370 = load i32, i32 addrspace(1)* %1369, align 4, !tbaa !14
  %1371 = shl nsw i32 %1367, 2
  %1372 = add nuw nsw i32 %1371, %15
  %1373 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1372
  store i32 %1370, i32 addrspace(3)* %1373, align 4, !tbaa !14
  %1374 = add nuw nsw i32 %1317, 8
  %1375 = add i32 %1318, 8
  %1376 = icmp eq i32 %1375, %1288
  br i1 %1376, label %1289, label %1316, !llvm.loop !25

1377:                                             ; preds = %1617
  %1378 = mul i32 %8, %5
  %1379 = add i32 %5, -1
  %1380 = and i32 %5, 7
  %1381 = icmp ult i32 %1379, 7
  br i1 %1381, label %1681, label %1382

1382:                                             ; preds = %1377
  %1383 = and i32 %5, -8
  br label %1620

1384:                                             ; preds = %1384, %1314
  %1385 = phi i64 [ 0, %1314 ], [ %1474, %1384 ]
  %1386 = phi i64 [ 0, %1314 ], [ %1475, %1384 ]
  %1387 = shl i64 %1385, 2
  %1388 = add i64 %1387, %1305
  %1389 = trunc i64 %1388 to i32
  %1390 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1389
  %1391 = load i32, i32 addrspace(3)* %1390, align 4, !tbaa !14
  %1392 = trunc i64 %1388 to i32
  %1393 = add i32 %1392, 2
  %1394 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1393
  %1395 = load i32, i32 addrspace(3)* %1394, align 4, !tbaa !14
  %1396 = add nsw i32 %1395, %1391
  store i32 %1396, i32 addrspace(3)* %1390, align 4, !tbaa !14
  %1397 = shl i64 %1385, 2
  %1398 = or i64 %1397, 4
  %1399 = add i64 %1398, %1305
  %1400 = trunc i64 %1399 to i32
  %1401 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1400
  %1402 = load i32, i32 addrspace(3)* %1401, align 4, !tbaa !14
  %1403 = trunc i64 %1399 to i32
  %1404 = add i32 %1403, 2
  %1405 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1404
  %1406 = load i32, i32 addrspace(3)* %1405, align 4, !tbaa !14
  %1407 = add nsw i32 %1406, %1402
  store i32 %1407, i32 addrspace(3)* %1401, align 4, !tbaa !14
  %1408 = shl i64 %1385, 2
  %1409 = or i64 %1408, 8
  %1410 = add i64 %1409, %1305
  %1411 = trunc i64 %1410 to i32
  %1412 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1411
  %1413 = load i32, i32 addrspace(3)* %1412, align 4, !tbaa !14
  %1414 = trunc i64 %1410 to i32
  %1415 = add i32 %1414, 2
  %1416 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1415
  %1417 = load i32, i32 addrspace(3)* %1416, align 4, !tbaa !14
  %1418 = add nsw i32 %1417, %1413
  store i32 %1418, i32 addrspace(3)* %1412, align 4, !tbaa !14
  %1419 = shl i64 %1385, 2
  %1420 = or i64 %1419, 12
  %1421 = add i64 %1420, %1305
  %1422 = trunc i64 %1421 to i32
  %1423 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1422
  %1424 = load i32, i32 addrspace(3)* %1423, align 4, !tbaa !14
  %1425 = trunc i64 %1421 to i32
  %1426 = add i32 %1425, 2
  %1427 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1426
  %1428 = load i32, i32 addrspace(3)* %1427, align 4, !tbaa !14
  %1429 = add nsw i32 %1428, %1424
  store i32 %1429, i32 addrspace(3)* %1423, align 4, !tbaa !14
  %1430 = shl i64 %1385, 2
  %1431 = or i64 %1430, 16
  %1432 = add i64 %1431, %1305
  %1433 = trunc i64 %1432 to i32
  %1434 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1433
  %1435 = load i32, i32 addrspace(3)* %1434, align 4, !tbaa !14
  %1436 = trunc i64 %1432 to i32
  %1437 = add i32 %1436, 2
  %1438 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1437
  %1439 = load i32, i32 addrspace(3)* %1438, align 4, !tbaa !14
  %1440 = add nsw i32 %1439, %1435
  store i32 %1440, i32 addrspace(3)* %1434, align 4, !tbaa !14
  %1441 = shl i64 %1385, 2
  %1442 = or i64 %1441, 20
  %1443 = add i64 %1442, %1305
  %1444 = trunc i64 %1443 to i32
  %1445 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1444
  %1446 = load i32, i32 addrspace(3)* %1445, align 4, !tbaa !14
  %1447 = trunc i64 %1443 to i32
  %1448 = add i32 %1447, 2
  %1449 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1448
  %1450 = load i32, i32 addrspace(3)* %1449, align 4, !tbaa !14
  %1451 = add nsw i32 %1450, %1446
  store i32 %1451, i32 addrspace(3)* %1445, align 4, !tbaa !14
  %1452 = shl i64 %1385, 2
  %1453 = or i64 %1452, 24
  %1454 = add i64 %1453, %1305
  %1455 = trunc i64 %1454 to i32
  %1456 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1455
  %1457 = load i32, i32 addrspace(3)* %1456, align 4, !tbaa !14
  %1458 = trunc i64 %1454 to i32
  %1459 = add i32 %1458, 2
  %1460 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1459
  %1461 = load i32, i32 addrspace(3)* %1460, align 4, !tbaa !14
  %1462 = add nsw i32 %1461, %1457
  store i32 %1462, i32 addrspace(3)* %1456, align 4, !tbaa !14
  %1463 = shl i64 %1385, 2
  %1464 = or i64 %1463, 28
  %1465 = add i64 %1464, %1305
  %1466 = trunc i64 %1465 to i32
  %1467 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1466
  %1468 = load i32, i32 addrspace(3)* %1467, align 4, !tbaa !14
  %1469 = trunc i64 %1465 to i32
  %1470 = add i32 %1469, 2
  %1471 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1470
  %1472 = load i32, i32 addrspace(3)* %1471, align 4, !tbaa !14
  %1473 = add nsw i32 %1472, %1468
  store i32 %1473, i32 addrspace(3)* %1467, align 4, !tbaa !14
  %1474 = add nuw i64 %1385, 8
  %1475 = add i64 %1386, 8
  %1476 = icmp eq i64 %1475, %1315
  br i1 %1476, label %1477, label %1384, !llvm.loop !26

1477:                                             ; preds = %1384, %1310
  %1478 = phi i64 [ 0, %1310 ], [ %1474, %1384 ]
  %1479 = icmp eq i64 %1312, 0
  br i1 %1479, label %1496, label %1480

1480:                                             ; preds = %1477, %1480
  %1481 = phi i64 [ %1493, %1480 ], [ %1478, %1477 ]
  %1482 = phi i64 [ %1494, %1480 ], [ 0, %1477 ]
  %1483 = shl i64 %1481, 2
  %1484 = add i64 %1483, %1305
  %1485 = trunc i64 %1484 to i32
  %1486 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1485
  %1487 = load i32, i32 addrspace(3)* %1486, align 4, !tbaa !14
  %1488 = trunc i64 %1484 to i32
  %1489 = add i32 %1488, 2
  %1490 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1489
  %1491 = load i32, i32 addrspace(3)* %1490, align 4, !tbaa !14
  %1492 = add nsw i32 %1491, %1487
  store i32 %1492, i32 addrspace(3)* %1486, align 4, !tbaa !14
  %1493 = add nuw i64 %1481, 1
  %1494 = add i64 %1482, 1
  %1495 = icmp eq i64 %1494, %1312
  br i1 %1495, label %1496, label %1480, !llvm.loop !27

1496:                                             ; preds = %1477, %1480, %1304
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1497 = icmp ne i32 %15, 0
  %1498 = select i1 %1497, i1 true, i1 %1306
  br i1 %1498, label %1617, label %1499

1499:                                             ; preds = %1496
  %1500 = add i64 %1307, -1
  %1501 = and i64 %1307, 7
  %1502 = icmp ult i64 %1500, 7
  br i1 %1502, label %1598, label %1503

1503:                                             ; preds = %1499
  %1504 = and i64 %1307, -8
  br label %1505

1505:                                             ; preds = %1505, %1503
  %1506 = phi i64 [ 0, %1503 ], [ %1595, %1505 ]
  %1507 = phi i64 [ 0, %1503 ], [ %1596, %1505 ]
  %1508 = shl i64 %1506, 2
  %1509 = add i64 %1508, %1305
  %1510 = trunc i64 %1509 to i32
  %1511 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1510
  %1512 = load i32, i32 addrspace(3)* %1511, align 4, !tbaa !14
  %1513 = trunc i64 %1509 to i32
  %1514 = add i32 %1513, 1
  %1515 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1514
  %1516 = load i32, i32 addrspace(3)* %1515, align 4, !tbaa !14
  %1517 = add nsw i32 %1516, %1512
  store i32 %1517, i32 addrspace(3)* %1511, align 4, !tbaa !14
  %1518 = shl i64 %1506, 2
  %1519 = or i64 %1518, 4
  %1520 = add i64 %1519, %1305
  %1521 = trunc i64 %1520 to i32
  %1522 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1521
  %1523 = load i32, i32 addrspace(3)* %1522, align 4, !tbaa !14
  %1524 = trunc i64 %1520 to i32
  %1525 = add i32 %1524, 1
  %1526 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1525
  %1527 = load i32, i32 addrspace(3)* %1526, align 4, !tbaa !14
  %1528 = add nsw i32 %1527, %1523
  store i32 %1528, i32 addrspace(3)* %1522, align 4, !tbaa !14
  %1529 = shl i64 %1506, 2
  %1530 = or i64 %1529, 8
  %1531 = add i64 %1530, %1305
  %1532 = trunc i64 %1531 to i32
  %1533 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1532
  %1534 = load i32, i32 addrspace(3)* %1533, align 4, !tbaa !14
  %1535 = trunc i64 %1531 to i32
  %1536 = add i32 %1535, 1
  %1537 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1536
  %1538 = load i32, i32 addrspace(3)* %1537, align 4, !tbaa !14
  %1539 = add nsw i32 %1538, %1534
  store i32 %1539, i32 addrspace(3)* %1533, align 4, !tbaa !14
  %1540 = shl i64 %1506, 2
  %1541 = or i64 %1540, 12
  %1542 = add i64 %1541, %1305
  %1543 = trunc i64 %1542 to i32
  %1544 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1543
  %1545 = load i32, i32 addrspace(3)* %1544, align 4, !tbaa !14
  %1546 = trunc i64 %1542 to i32
  %1547 = add i32 %1546, 1
  %1548 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1547
  %1549 = load i32, i32 addrspace(3)* %1548, align 4, !tbaa !14
  %1550 = add nsw i32 %1549, %1545
  store i32 %1550, i32 addrspace(3)* %1544, align 4, !tbaa !14
  %1551 = shl i64 %1506, 2
  %1552 = or i64 %1551, 16
  %1553 = add i64 %1552, %1305
  %1554 = trunc i64 %1553 to i32
  %1555 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1554
  %1556 = load i32, i32 addrspace(3)* %1555, align 4, !tbaa !14
  %1557 = trunc i64 %1553 to i32
  %1558 = add i32 %1557, 1
  %1559 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1558
  %1560 = load i32, i32 addrspace(3)* %1559, align 4, !tbaa !14
  %1561 = add nsw i32 %1560, %1556
  store i32 %1561, i32 addrspace(3)* %1555, align 4, !tbaa !14
  %1562 = shl i64 %1506, 2
  %1563 = or i64 %1562, 20
  %1564 = add i64 %1563, %1305
  %1565 = trunc i64 %1564 to i32
  %1566 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1565
  %1567 = load i32, i32 addrspace(3)* %1566, align 4, !tbaa !14
  %1568 = trunc i64 %1564 to i32
  %1569 = add i32 %1568, 1
  %1570 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1569
  %1571 = load i32, i32 addrspace(3)* %1570, align 4, !tbaa !14
  %1572 = add nsw i32 %1571, %1567
  store i32 %1572, i32 addrspace(3)* %1566, align 4, !tbaa !14
  %1573 = shl i64 %1506, 2
  %1574 = or i64 %1573, 24
  %1575 = add i64 %1574, %1305
  %1576 = trunc i64 %1575 to i32
  %1577 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1576
  %1578 = load i32, i32 addrspace(3)* %1577, align 4, !tbaa !14
  %1579 = trunc i64 %1575 to i32
  %1580 = add i32 %1579, 1
  %1581 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1580
  %1582 = load i32, i32 addrspace(3)* %1581, align 4, !tbaa !14
  %1583 = add nsw i32 %1582, %1578
  store i32 %1583, i32 addrspace(3)* %1577, align 4, !tbaa !14
  %1584 = shl i64 %1506, 2
  %1585 = or i64 %1584, 28
  %1586 = add i64 %1585, %1305
  %1587 = trunc i64 %1586 to i32
  %1588 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1587
  %1589 = load i32, i32 addrspace(3)* %1588, align 4, !tbaa !14
  %1590 = trunc i64 %1586 to i32
  %1591 = add i32 %1590, 1
  %1592 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1591
  %1593 = load i32, i32 addrspace(3)* %1592, align 4, !tbaa !14
  %1594 = add nsw i32 %1593, %1589
  store i32 %1594, i32 addrspace(3)* %1588, align 4, !tbaa !14
  %1595 = add nuw i64 %1506, 8
  %1596 = add i64 %1507, 8
  %1597 = icmp eq i64 %1596, %1504
  br i1 %1597, label %1598, label %1505, !llvm.loop !26

1598:                                             ; preds = %1505, %1499
  %1599 = phi i64 [ 0, %1499 ], [ %1595, %1505 ]
  %1600 = icmp eq i64 %1501, 0
  br i1 %1600, label %1617, label %1601

1601:                                             ; preds = %1598, %1601
  %1602 = phi i64 [ %1614, %1601 ], [ %1599, %1598 ]
  %1603 = phi i64 [ %1615, %1601 ], [ 0, %1598 ]
  %1604 = shl i64 %1602, 2
  %1605 = add i64 %1604, %1305
  %1606 = trunc i64 %1605 to i32
  %1607 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1606
  %1608 = load i32, i32 addrspace(3)* %1607, align 4, !tbaa !14
  %1609 = trunc i64 %1605 to i32
  %1610 = add i32 %1609, 1
  %1611 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1610
  %1612 = load i32, i32 addrspace(3)* %1611, align 4, !tbaa !14
  %1613 = add nsw i32 %1612, %1608
  store i32 %1613, i32 addrspace(3)* %1607, align 4, !tbaa !14
  %1614 = add nuw i64 %1602, 1
  %1615 = add i64 %1603, 1
  %1616 = icmp eq i64 %1615, %1501
  br i1 %1616, label %1617, label %1601, !llvm.loop !28

1617:                                             ; preds = %1598, %1601, %1496
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1618 = icmp eq i32 %15, 0
  %1619 = select i1 %1618, i1 %486, i1 false
  br i1 %1619, label %1377, label %1696

1620:                                             ; preds = %1620, %1382
  %1621 = phi i32 [ 0, %1382 ], [ %1678, %1620 ]
  %1622 = phi i32 [ 0, %1382 ], [ %1679, %1620 ]
  %1623 = shl nsw i32 %1621, 2
  %1624 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1623
  %1625 = load i32, i32 addrspace(3)* %1624, align 4, !tbaa !14
  %1626 = add i32 %1621, %1378
  %1627 = zext i32 %1626 to i64
  %1628 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1627
  store i32 %1625, i32 addrspace(1)* %1628, align 4, !tbaa !14
  %1629 = or i32 %1621, 1
  %1630 = shl nsw i32 %1629, 2
  %1631 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1630
  %1632 = load i32, i32 addrspace(3)* %1631, align 4, !tbaa !14
  %1633 = add i32 %1629, %1378
  %1634 = zext i32 %1633 to i64
  %1635 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1634
  store i32 %1632, i32 addrspace(1)* %1635, align 4, !tbaa !14
  %1636 = or i32 %1621, 2
  %1637 = shl nsw i32 %1636, 2
  %1638 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1637
  %1639 = load i32, i32 addrspace(3)* %1638, align 4, !tbaa !14
  %1640 = add i32 %1636, %1378
  %1641 = zext i32 %1640 to i64
  %1642 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1641
  store i32 %1639, i32 addrspace(1)* %1642, align 4, !tbaa !14
  %1643 = or i32 %1621, 3
  %1644 = shl nsw i32 %1643, 2
  %1645 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1644
  %1646 = load i32, i32 addrspace(3)* %1645, align 4, !tbaa !14
  %1647 = add i32 %1643, %1378
  %1648 = zext i32 %1647 to i64
  %1649 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1648
  store i32 %1646, i32 addrspace(1)* %1649, align 4, !tbaa !14
  %1650 = or i32 %1621, 4
  %1651 = shl nsw i32 %1650, 2
  %1652 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1651
  %1653 = load i32, i32 addrspace(3)* %1652, align 4, !tbaa !14
  %1654 = add i32 %1650, %1378
  %1655 = zext i32 %1654 to i64
  %1656 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1655
  store i32 %1653, i32 addrspace(1)* %1656, align 4, !tbaa !14
  %1657 = or i32 %1621, 5
  %1658 = shl nsw i32 %1657, 2
  %1659 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1658
  %1660 = load i32, i32 addrspace(3)* %1659, align 4, !tbaa !14
  %1661 = add i32 %1657, %1378
  %1662 = zext i32 %1661 to i64
  %1663 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1662
  store i32 %1660, i32 addrspace(1)* %1663, align 4, !tbaa !14
  %1664 = or i32 %1621, 6
  %1665 = shl nsw i32 %1664, 2
  %1666 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1665
  %1667 = load i32, i32 addrspace(3)* %1666, align 4, !tbaa !14
  %1668 = add i32 %1664, %1378
  %1669 = zext i32 %1668 to i64
  %1670 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1669
  store i32 %1667, i32 addrspace(1)* %1670, align 4, !tbaa !14
  %1671 = or i32 %1621, 7
  %1672 = shl nsw i32 %1671, 2
  %1673 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1672
  %1674 = load i32, i32 addrspace(3)* %1673, align 4, !tbaa !14
  %1675 = add i32 %1671, %1378
  %1676 = zext i32 %1675 to i64
  %1677 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1676
  store i32 %1674, i32 addrspace(1)* %1677, align 4, !tbaa !14
  %1678 = add nuw nsw i32 %1621, 8
  %1679 = add i32 %1622, 8
  %1680 = icmp eq i32 %1679, %1383
  br i1 %1680, label %1681, label %1620, !llvm.loop !29

1681:                                             ; preds = %1620, %1377
  %1682 = phi i32 [ 0, %1377 ], [ %1678, %1620 ]
  %1683 = icmp eq i32 %1380, 0
  br i1 %1683, label %1696, label %1684

1684:                                             ; preds = %1681, %1684
  %1685 = phi i32 [ %1693, %1684 ], [ %1682, %1681 ]
  %1686 = phi i32 [ %1694, %1684 ], [ 0, %1681 ]
  %1687 = shl nsw i32 %1685, 2
  %1688 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_bins, i32 0, i32 %1687
  %1689 = load i32, i32 addrspace(3)* %1688, align 4, !tbaa !14
  %1690 = add i32 %1685, %1378
  %1691 = zext i32 %1690 to i64
  %1692 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1691
  store i32 %1689, i32 addrspace(1)* %1692, align 4, !tbaa !14
  %1693 = add nuw nsw i32 %1685, 1
  %1694 = add i32 %1686, 1
  %1695 = icmp eq i32 %1694, %1380
  br i1 %1695, label %1696, label %1684, !llvm.loop !30

1696:                                             ; preds = %1681, %1684, %1617
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

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
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %11, i32 noundef 3, i64 noundef 0, i64 noundef %0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
  %13 = extractelement <2 x i64> %12, i64 0
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %5
  %16 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %17 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %17, i32 0)
  %19 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %16, i32 %18)
  %20 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %21 = icmp eq i32 %19, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %15
  %23 = tail call i64 @llvm.ctpop.i64(i64 %20), !range !34
  %24 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %23 syncscope("agent-one-as") monotonic, align 8
  br label %25

25:                                               ; preds = %22, %15, %5
  %26 = inttoptr i64 %13 to i8 addrspace(1)*
  br label %1423

27:                                               ; preds = %3
  %28 = trunc i64 %0 to i32
  %29 = tail call i32 @llvm.umax.i32(i32 %28, i32 16)
  %30 = tail call i32 @llvm.ctlz.i32(i32 %29, i1 false), !range !35
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
  %66 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %64) #13, !srcloc !36
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
  %75 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %73) #13, !srcloc !36
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %1410, label %77

77:                                               ; preds = %71
  %78 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %79 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %80 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %79, i32 0)
  %81 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %78, i32 %80)
  %82 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %81) #13, !srcloc !37
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
  %91 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %92 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %93 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %92, i32 0)
  %94 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %91, i32 %93)
  %95 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %96 = tail call i64 @llvm.ctpop.i64(i64 %95), !range !34
  %97 = trunc i64 %96 to i32
  br label %98

98:                                               ; preds = %631, %90
  %99 = phi i32 [ %94, %90 ], [ %102, %631 ]
  %100 = phi i32 [ %88, %90 ], [ %632, %631 ]
  %101 = phi %3 addrspace(1)* [ undef, %90 ], [ %633, %631 ]
  %102 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %99) #13, !srcloc !37
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
  %113 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !38
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
  %139 = tail call i64 @llvm.cttz.i64(i64 %136, i1 true), !range !34
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
  %176 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %177 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %178 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %177, i32 0)
  %179 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %176, i32 %178)
  br label %180

180:                                              ; preds = %548, %174
  %181 = phi i32 [ %179, %174 ], [ %550, %548 ]
  %182 = phi %3 addrspace(1)* [ undef, %174 ], [ %551, %548 ]
  %183 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %181) #13, !srcloc !37
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
  %202 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %203 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %204 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %203, i32 0)
  %205 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %202, i32 %204)
  %206 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %205) #13, !srcloc !37
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
  %233 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %232, i32 noundef 3, i64 noundef 0, i64 noundef 6144, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  %247 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %248 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %249 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %248, i32 0)
  %250 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %247, i32 %249)
  %251 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %252 = tail call i64 @llvm.ctpop.i64(i64 %251), !range !34
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
  %267 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %266) #13, !srcloc !37
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
  %280 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %279, i32 noundef 3, i64 noundef %244, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  %300 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %301 = tail call i32 @llvm.read_register.i32(metadata !32) #14
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
  %402 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !41
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
  %411 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %410, i32 noundef 3, i64 noundef 0, i64 noundef 2097152, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  %426 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %427 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %428 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %427, i32 0)
  %429 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %426, i32 %428)
  %430 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %429) #13, !srcloc !37
  %431 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %432 = tail call i64 @llvm.ctpop.i64(i64 %431), !range !34
  %433 = trunc i64 %432 to i32
  %434 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !43
  %435 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !44
  %436 = add i32 %435, 31
  %437 = lshr i32 %436, 5
  br i1 %55, label %461, label %438

438:                                              ; preds = %424
  %439 = icmp ult i32 %430, %437
  br i1 %439, label %446, label %440

440:                                              ; preds = %446, %438
  %441 = mul i32 %434, %433
  %442 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !45
  %443 = mul i32 %434, %430
  %444 = add i32 %442, %443
  %445 = icmp ult i32 %444, %435
  br i1 %445, label %452, label %470

446:                                              ; preds = %438, %446
  %447 = phi i32 [ %450, %446 ], [ %430, %438 ]
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %448
  store i32 0, i32 addrspace(1)* %449, align 4, !tbaa !46
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
  store i32 %455, i32 addrspace(1)* %458, align 4, !tbaa !46
  %459 = add i32 %453, %441
  %460 = icmp ult i32 %459, %435
  br i1 %460, label %452, label %470

461:                                              ; preds = %424
  %462 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !47
  %463 = icmp ult i32 %430, %437
  br i1 %463, label %464, label %470

464:                                              ; preds = %461, %464
  %465 = phi i32 [ %468, %464 ], [ %430, %461 ]
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %466
  store i32 %462, i32 addrspace(1)* %467, align 4, !tbaa !46
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
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !46
  %480 = or i32 %479, %475
  store i32 %480, i32 addrspace(1)* %478, align 4, !tbaa !46
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
  %489 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %488) #13, !srcloc !37
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
  %509 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %508, i32 noundef 3, i64 noundef %422, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  store i32 %495, i32 addrspace(1)* %484, align 4, !tbaa !48
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
  %555 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %556 = tail call i32 @llvm.read_register.i32(metadata !32) #14
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
  %635 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %636 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %637 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %636, i32 0)
  %638 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %635, i32 %637)
  %639 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %640 = tail call i64 @llvm.ctpop.i64(i64 %639), !range !34
  %641 = trunc i64 %640 to i32
  br label %642

642:                                              ; preds = %1295, %634
  %643 = phi i32 [ %43, %634 ], [ %1297, %1295 ]
  %644 = phi i32 [ %638, %634 ], [ %646, %1295 ]
  %645 = phi %3 addrspace(1)* [ undef, %634 ], [ %1298, %1295 ]
  %646 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %644) #13, !srcloc !37
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
  %658 = load i32, i32 addrspace(4)* %657, align 4, !tbaa !50
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
  %685 = tail call i64 @llvm.cttz.i64(i64 %682, i1 true), !range !34
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
  %736 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %737 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %738 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %737, i32 0)
  %739 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %736, i32 %738)
  %740 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %741 = tail call i64 @llvm.ctpop.i64(i64 %740), !range !34
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
  %763 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %760) #13, !srcloc !37
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
  %774 = load i32, i32 addrspace(4)* %745, align 4, !tbaa !38
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
  %800 = tail call i64 @llvm.cttz.i64(i64 %797, i1 true), !range !34
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
  %837 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %838 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %839 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %838, i32 0)
  %840 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %837, i32 %839)
  br label %841

841:                                              ; preds = %1209, %835
  %842 = phi i32 [ %840, %835 ], [ %1211, %1209 ]
  %843 = phi %3 addrspace(1)* [ undef, %835 ], [ %1212, %1209 ]
  %844 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %842) #13, !srcloc !37
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
  %863 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %864 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %865 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %864, i32 0)
  %866 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %863, i32 %865)
  %867 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %866) #13, !srcloc !37
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
  %894 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %893, i32 noundef 3, i64 noundef 0, i64 noundef 6144, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  %908 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %909 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %910 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %909, i32 0)
  %911 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %908, i32 %910)
  %912 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %913 = tail call i64 @llvm.ctpop.i64(i64 %912), !range !34
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
  %928 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %927) #13, !srcloc !37
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
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %940, i32 noundef 3, i64 noundef %905, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  %961 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %962 = tail call i32 @llvm.read_register.i32(metadata !32) #14
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
  %1063 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !41
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
  %1072 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1071, i32 noundef 3, i64 noundef 0, i64 noundef 2097152, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  %1087 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %1088 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %1089 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1088, i32 0)
  %1090 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1087, i32 %1089)
  %1091 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1090) #13, !srcloc !37
  %1092 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %1093 = tail call i64 @llvm.ctpop.i64(i64 %1092), !range !34
  %1094 = trunc i64 %1093 to i32
  %1095 = load i32, i32 addrspace(4)* %750, align 4, !tbaa !43
  %1096 = load i32, i32 addrspace(4)* %751, align 4, !tbaa !44
  %1097 = add i32 %1096, 31
  %1098 = lshr i32 %1097, 5
  br i1 %754, label %1122, label %1099

1099:                                             ; preds = %1085
  %1100 = icmp ult i32 %1091, %1098
  br i1 %1100, label %1107, label %1101

1101:                                             ; preds = %1107, %1099
  %1102 = mul i32 %1095, %1094
  %1103 = load i32, i32 addrspace(4)* %755, align 4, !tbaa !45
  %1104 = mul i32 %1095, %1091
  %1105 = add i32 %1103, %1104
  %1106 = icmp ult i32 %1105, %1096
  br i1 %1106, label %1113, label %1131

1107:                                             ; preds = %1099, %1107
  %1108 = phi i32 [ %1111, %1107 ], [ %1091, %1099 ]
  %1109 = zext i32 %1108 to i64
  %1110 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1109
  store i32 0, i32 addrspace(1)* %1110, align 4, !tbaa !46
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
  store i32 %1116, i32 addrspace(1)* %1119, align 4, !tbaa !46
  %1120 = add i32 %1114, %1102
  %1121 = icmp ult i32 %1120, %1096
  br i1 %1121, label %1113, label %1131

1122:                                             ; preds = %1085
  %1123 = load i32, i32 addrspace(4)* %756, align 4, !tbaa !47
  %1124 = icmp ult i32 %1091, %1098
  br i1 %1124, label %1125, label %1131

1125:                                             ; preds = %1122, %1125
  %1126 = phi i32 [ %1129, %1125 ], [ %1091, %1122 ]
  %1127 = zext i32 %1126 to i64
  %1128 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1127
  store i32 %1123, i32 addrspace(1)* %1128, align 4, !tbaa !46
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
  %1140 = load i32, i32 addrspace(1)* %1139, align 4, !tbaa !46
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32 addrspace(1)* %1139, align 4, !tbaa !46
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
  %1150 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1149) #13, !srcloc !37
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
  %1170 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1169, i32 noundef 3, i64 noundef %1083, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #13
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
  store i32 %1156, i32 addrspace(1)* %1145, align 4, !tbaa !48
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
  %1216 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %1217 = tail call i32 @llvm.read_register.i32(metadata !32) #14
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
  %1313 = tail call i32 @llvm.read_register.i32(metadata !31) #14
  %1314 = tail call i32 @llvm.read_register.i32(metadata !32) #14
  %1315 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1314, i32 0)
  %1316 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1313, i32 %1315)
  %1317 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1316) #13, !srcloc !37
  %1318 = tail call i64 @llvm.read_register.i64(metadata !33) #14
  %1319 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 1
  %1320 = load atomic i64, i64 addrspace(1)* %1319 seq_cst, align 8, !tbaa !51
  %1321 = inttoptr i64 %1320 to %5 addrspace(1)*
  %1322 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 0
  %1323 = load i32, i32 addrspace(1)* %1322, align 4, !tbaa !53
  %1324 = icmp eq i32 %1317, 0
  br i1 %1324, label %1325, label %1330

1325:                                             ; preds = %1311
  %1326 = tail call i64 @llvm.ctpop.i64(i64 %1318), !range !34
  %1327 = trunc i64 %1326 to i32
  %1328 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 2
  %1329 = atomicrmw add i32 addrspace(1)* %1328, i32 %1327 syncscope("agent-one-as") monotonic, align 4
  br label %1330

1330:                                             ; preds = %1325, %1311
  %1331 = phi i32 [ %1329, %1325 ], [ 0, %1311 ]
  %1332 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1331)
  %1333 = zext i32 %1323 to i64
  %1334 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 0
  %1335 = load i32, i32 addrspace(4)* %1334, align 4, !tbaa !44
  %1336 = add i32 %1335, 31
  %1337 = lshr i32 %1336, 5
  %1338 = icmp ult i32 %1336, 32
  br i1 %1338, label %1397, label %1339

1339:                                             ; preds = %1330
  %1340 = add i32 %1332, %1317
  %1341 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 7
  %1342 = load i32, i32 addrspace(4)* %1341, align 4, !tbaa !54
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
  %1367 = tail call i32 @llvm.cttz.i32(i32 %1366, i1 false), !range !35
  %1368 = and i32 %1367, 31
  %1369 = shl nuw i32 1, %1368
  %1370 = atomicrmw or i32 addrspace(1)* %1362, i32 %1369 syncscope("agent-one-as") monotonic, align 4
  %1371 = and i32 %1370, %1369
  %1372 = icmp eq i32 %1371, 0
  br i1 %1372, label %1373, label %1382

1373:                                             ; preds = %1365
  %1374 = shl i32 %1358, 5
  %1375 = add i32 %1367, %1374
  %1376 = load i32, i32 addrspace(4)* %1347, align 4, !tbaa !55
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
  %1400 = tail call i64 @llvm.amdgcn.icmp.i64.i64(i64 noundef %1399, i64 noundef 0, i32 noundef 33) #15
  br i1 %1324, label %1401, label %1406

1401:                                             ; preds = %1397
  %1402 = tail call i64 @llvm.ctpop.i64(i64 %1400), !range !34
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
  %1414 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1412) #13, !srcloc !56
  %1415 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1414, i32 noundef 0, i32 noundef 33) #15
  %1416 = icmp eq i64 %1415, 0
  br i1 %1416, label %1417, label %71

1417:                                             ; preds = %1410, %68, %63
  %1418 = phi i32 [ 0, %63 ], [ %66, %68 ], [ %1411, %1410 ]
  %1419 = phi i8 addrspace(1)* [ %65, %63 ], [ %65, %68 ], [ %1413, %1410 ]
  %1420 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1418) #13, !srcloc !56
  %1421 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1420, i32 noundef 0, i32 noundef 33) #15
  %1422 = icmp eq i64 %1421, 0
  br i1 %1422, label %1423, label %63

1423:                                             ; preds = %1417, %25, %1
  %1424 = phi i8 addrspace(1)* [ %26, %25 ], [ null, %1 ], [ %1419, %1417 ]
  ret i8 addrspace(1)* %1424
}

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #5

; Function Attrs: nofree nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #7

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i32(i32, i32, i32 immarg) #7

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.ds.bpermute(i32, i32) #7

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #8

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i64(i64, i64, i32 immarg) #7

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #5

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i32 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8, i64 noundef %9) unnamed_addr #10 {
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
  store i8* %0, i8* addrspace(5)* %11, align 8, !tbaa !57
  store i32 %1, i32 addrspace(5)* %12, align 4, !tbaa !46
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  store i64 %9, i64 addrspace(5)* %20, align 8, !tbaa !7
  %28 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %28) #11
  %29 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %30 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %29)
  store i32 %30, i32 addrspace(5)* %21, align 4, !tbaa !46
  %31 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %32 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %31) #13, !srcloc !59
  store i32 %32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %33 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %33) #11
  %34 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %35 = call i32 @llvm.amdgcn.readfirstlane(i32 %34)
  store i32 %35, i32 addrspace(5)* %22, align 4, !tbaa !46
  %36 = bitcast %6 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %36) #11
  %37 = load i8*, i8* addrspace(5)* %11, align 8, !tbaa !57
  %38 = addrspacecast i8* %37 to %6 addrspace(1)*
  store %6 addrspace(1)* %38, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !57
  %39 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %39) #11
  %40 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !57
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %42 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !46
  %43 = icmp eq i32 %41, %42
  br i1 %43, label %44, label %69

44:                                               ; preds = %10
  %45 = getelementptr inbounds %6, %6 addrspace(1)* %40, i64 0, i32 3
  %46 = load atomic i64, i64 addrspace(1)* %45 syncscope("one-as") acquire, align 8
  %47 = getelementptr %6, %6 addrspace(1)* %40, i64 0, i32 0
  %48 = getelementptr %6, %6 addrspace(1)* %40, i64 0, i32 5
  %49 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %47, align 8, !tbaa !60
  %50 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !63
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
  %59 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %47, align 8, !tbaa !60
  %60 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !63
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %80) #11
  %81 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !57
  %82 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %83 = getelementptr %6, %6 addrspace(1)* %81, i64 0, i32 0
  %84 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %83, align 8, !tbaa !60
  %85 = getelementptr %6, %6 addrspace(1)* %81, i64 0, i32 5
  %86 = load i64, i64 addrspace(1)* %85, align 8, !tbaa !63
  %87 = and i64 %82, %86
  %88 = getelementptr inbounds %7, %7 addrspace(1)* %84, i64 %87
  store %7 addrspace(1)* %88, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !57
  %89 = bitcast %8 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %89) #11
  %90 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !57
  %91 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %92 = getelementptr %6, %6 addrspace(1)* %90, i64 0, i32 1
  %93 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(1)* %92, align 8, !tbaa !64
  %94 = getelementptr %6, %6 addrspace(1)* %90, i64 0, i32 5
  %95 = load i64, i64 addrspace(1)* %94, align 8, !tbaa !63
  %96 = and i64 %91, %95
  %97 = getelementptr inbounds %8, %8 addrspace(1)* %93, i64 %96
  store %8 addrspace(1)* %97, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !57
  %98 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !57
  %99 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !57
  %100 = load i32, i32 addrspace(5)* %12, align 4, !tbaa !46
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i64, i64 addrspace(5)* %20, align 8, !tbaa !7
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %110 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !46
  %111 = call i64 @llvm.read_register.i64(metadata !33) #14
  %112 = icmp eq i32 %109, %110
  br i1 %112, label %113, label %117

113:                                              ; preds = %69
  %114 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 2
  store i32 %100, i32 addrspace(1)* %114, align 8, !tbaa !65
  %115 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 1
  store i64 %111, i64 addrspace(1)* %115, align 8, !tbaa !67
  %116 = getelementptr inbounds %7, %7 addrspace(1)* %98, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %116, align 4, !tbaa !68
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
  %127 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !57
  %128 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %130 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !46
  %131 = icmp eq i32 %129, %130
  br i1 %131, label %132, label %164

132:                                              ; preds = %117
  %133 = getelementptr inbounds %6, %6 addrspace(1)* %127, i64 0, i32 4
  %134 = load atomic i64, i64 addrspace(1)* %133 syncscope("one-as") monotonic, align 8
  %135 = getelementptr %6, %6 addrspace(1)* %127, i64 0, i32 0
  %136 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %135, align 8, !tbaa !60
  %137 = getelementptr %6, %6 addrspace(1)* %127, i64 0, i32 5
  %138 = load i64, i64 addrspace(1)* %137, align 8, !tbaa !63
  %139 = and i64 %138, %128
  %140 = getelementptr inbounds %7, %7 addrspace(1)* %136, i64 %139, i32 0
  store i64 %134, i64 addrspace(1)* %140, align 8, !tbaa !69
  %141 = cmpxchg i64 addrspace(1)* %133, i64 %134, i64 %128 syncscope("one-as") release monotonic, align 8
  %142 = extractvalue { i64, i1 } %141, 1
  br i1 %142, label %148, label %143

143:                                              ; preds = %143, %132
  %144 = phi { i64, i1 } [ %146, %143 ], [ %141, %132 ]
  %145 = extractvalue { i64, i1 } %144, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %145, i64 addrspace(1)* %140, align 8, !tbaa !69
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
  %155 = load i64, i64 addrspace(1)* %154, align 16, !tbaa !70
  %156 = icmp eq i64 %155, 0
  br i1 %156, label %164, label %157

157:                                              ; preds = %148
  %158 = inttoptr i64 %155 to i64 addrspace(1)*
  %159 = getelementptr inbounds %10, %10 addrspace(1)* %151, i64 0, i32 3
  %160 = load i32, i32 addrspace(1)* %159, align 8, !tbaa !72
  %161 = zext i32 %160 to i64
  store atomic i64 %161, i64 addrspace(1)* %158 syncscope("one-as") release, align 8
  %162 = call i32 @llvm.amdgcn.readfirstlane(i32 %160)
  %163 = and i32 %162, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %163)
  br label %164

164:                                              ; preds = %117, %148, %157
  %165 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %165) #11
  %166 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !57
  %167 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %26, align 8, !tbaa !57
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %169 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !46
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
  %189 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %23, align 8, !tbaa !57
  %190 = load i64, i64 addrspace(5)* %24, align 8, !tbaa !7
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !46
  %192 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !46
  %193 = icmp eq i32 %191, %192
  br i1 %193, label %194, label %214

194:                                              ; preds = %181
  %195 = getelementptr inbounds %6, %6 addrspace(1)* %189, i64 0, i32 5
  %196 = load i64, i64 addrspace(1)* %195, align 8, !tbaa !63
  %197 = add i64 %196, 1
  %198 = add i64 %197, %190
  %199 = icmp eq i64 %198, 0
  %200 = select i1 %199, i64 %197, i64 %198
  %201 = getelementptr inbounds %6, %6 addrspace(1)* %189, i64 0, i32 3
  %202 = load atomic i64, i64 addrspace(1)* %201 syncscope("one-as") monotonic, align 8
  %203 = getelementptr %6, %6 addrspace(1)* %189, i64 0, i32 0
  %204 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %203, align 8, !tbaa !60
  %205 = and i64 %200, %196
  %206 = getelementptr inbounds %7, %7 addrspace(1)* %204, i64 %205, i32 0
  store i64 %202, i64 addrspace(1)* %206, align 8, !tbaa !69
  %207 = cmpxchg i64 addrspace(1)* %201, i64 %202, i64 %200 syncscope("one-as") release monotonic, align 8
  %208 = extractvalue { i64, i1 } %207, 1
  br i1 %208, label %214, label %209

209:                                              ; preds = %209, %194
  %210 = phi { i64, i1 } [ %212, %209 ], [ %207, %194 ]
  %211 = extractvalue { i64, i1 } %210, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %211, i64 addrspace(1)* %206, align 8, !tbaa !69
  %212 = cmpxchg i64 addrspace(1)* %201, i64 %211, i64 %200 syncscope("one-as") release monotonic, align 8
  %213 = extractvalue { i64, i1 } %212, 1
  br i1 %213, label %214, label %209

214:                                              ; preds = %181, %194, %209
  %215 = load <2 x i64>, <2 x i64> addrspace(5)* %27, align 16, !tbaa !11
  %216 = bitcast <2 x i64> addrspace(5)* %27 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %216) #11
  %217 = bitcast %8 addrspace(1)* addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #11
  %218 = bitcast %7 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #11
  %219 = bitcast i64 addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #11
  %220 = bitcast %6 addrspace(1)* addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %220) #11
  %221 = bitcast i32 addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #11
  %222 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %222) #11
  ret <2 x i64> %215
}

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #11

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #6

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #6

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #12

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { convergent noinline norecurse nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { nofree nounwind readonly }
attributes #5 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #8 = { mustprogress nounwind willreturn }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #11 = { nounwind }
attributes #12 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #13 = { convergent nounwind }
attributes #14 = { convergent }
attributes #15 = { convergent nounwind readnone willreturn }

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
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !16, i64 0}
!23 = distinct !{!23, !20}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !20}
!26 = distinct !{!26, !20}
!27 = distinct !{!27, !13}
!28 = distinct !{!28, !13}
!29 = distinct !{!29, !20}
!30 = distinct !{!30, !13}
!31 = !{!"exec_hi"}
!32 = !{!"exec_lo"}
!33 = !{!"exec"}
!34 = !{i64 0, i64 65}
!35 = !{i32 0, i32 33}
!36 = !{i64 7014}
!37 = !{i64 7137}
!38 = !{!39, !40, i64 8}
!39 = !{!"kind_info_s", !40, i64 0, !40, i64 4, !40, i64 8, !40, i64 12, !40, i64 16, !40, i64 20, !40, i64 24, !40, i64 28}
!40 = !{!"int", !9, i64 0}
!41 = !{!42, !8, i64 108552}
!42 = !{!"heap_s", !9, i64 0, !9, i64 2048, !9, i64 4096, !9, i64 6144, !9, i64 8192, !9, i64 10240, !9, i64 108544, !8, i64 108552, !9, i64 108560, !9, i64 108672}
!43 = !{!39, !40, i64 20}
!44 = !{!39, !40, i64 0}
!45 = !{!39, !40, i64 16}
!46 = !{!40, !40, i64 0}
!47 = !{!39, !40, i64 24}
!48 = !{!49, !40, i64 4}
!49 = !{!"slab_s", !40, i64 0, !40, i64 4, !9, i64 8, !40, i64 12, !9, i64 16}
!50 = !{!39, !40, i64 4}
!51 = !{!52, !9, i64 8}
!52 = !{!"sdata_s", !9, i64 0, !9, i64 8, !9, i64 16}
!53 = !{!49, !40, i64 0}
!54 = !{!39, !40, i64 28}
!55 = !{!39, !40, i64 12}
!56 = !{i64 751}
!57 = !{!58, !58, i64 0}
!58 = !{!"any pointer", !9, i64 0}
!59 = !{i64 2662}
!60 = !{!61, !58, i64 0}
!61 = !{!"", !58, i64 0, !58, i64 8, !62, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!62 = !{!"hsa_signal_s", !8, i64 0}
!63 = !{!61, !8, i64 40}
!64 = !{!61, !58, i64 8}
!65 = !{!66, !40, i64 16}
!66 = !{!"", !8, i64 0, !8, i64 8, !40, i64 16, !40, i64 20}
!67 = !{!66, !8, i64 8}
!68 = !{!66, !40, i64 20}
!69 = !{!66, !8, i64 0}
!70 = !{!71, !8, i64 16}
!71 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !40, i64 24, !40, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!72 = !{!71, !40, i64 24}
