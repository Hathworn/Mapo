; ModuleID = '../data/hip_kernels/4156/18/main.cu'
source_filename = "../data/hip_kernels/4156/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9merge_sumPhS_PfS0_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = icmp sgt i32 %4, 0
  %27 = mul i32 %12, %25
  %28 = add i32 %27, %7
  %29 = shl i32 %28, 5
  %30 = add i32 %29, %8
  %31 = mul nsw i32 %30, 3
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %32
  store i8 0, i8 addrspace(1)* %33, align 1, !tbaa !16
  %34 = add nsw i32 %31, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %35
  store i8 0, i8 addrspace(1)* %36, align 1, !tbaa !16
  %37 = add nsw i32 %31, 2
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %38
  store i8 0, i8 addrspace(1)* %39, align 1, !tbaa !16
  br i1 %26, label %40, label %82

40:                                               ; preds = %6
  %41 = sext i32 %30 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  br label %43

43:                                               ; preds = %40, %43
  %44 = phi i8 [ 0, %40 ], [ %79, %43 ]
  %45 = phi i8 [ 0, %40 ], [ %71, %43 ]
  %46 = phi i8 [ 0, %40 ], [ %63, %43 ]
  %47 = phi i32 [ 0, %40 ], [ %80, %43 ]
  %48 = mul nsw i32 %47, %5
  %49 = add nsw i32 %48, %30
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !19
  %53 = load float, float addrspace(1)* %42, align 4, !tbaa !19
  %54 = fdiv contract float %52, %53
  %55 = mul nsw i32 %48, 3
  %56 = add nsw i32 %55, %31
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !16
  %60 = uitofp i8 %59 to float
  %61 = fmul contract float %54, %60
  %62 = fptoui float %61 to i8
  %63 = add i8 %46, %62
  store i8 %63, i8 addrspace(1)* %33, align 1, !tbaa !16
  %64 = add nsw i32 %56, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !16
  %68 = uitofp i8 %67 to float
  %69 = fmul contract float %54, %68
  %70 = fptoui float %69 to i8
  %71 = add i8 %45, %70
  store i8 %71, i8 addrspace(1)* %36, align 1, !tbaa !16
  %72 = add nsw i32 %56, 2
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !16
  %76 = uitofp i8 %75 to float
  %77 = fmul contract float %54, %76
  %78 = fptoui float %77 to i8
  %79 = add i8 %44, %78
  store i8 %79, i8 addrspace(1)* %39, align 1, !tbaa !16
  %80 = add nuw nsw i32 %47, 1
  %81 = icmp eq i32 %80, %4
  br i1 %81, label %82, label %43, !llvm.loop !21

82:                                               ; preds = %43, %6
  %83 = add nsw i32 %12, 8
  %84 = mul i32 %83, %25
  %85 = add i32 %84, %7
  %86 = shl i32 %85, 5
  %87 = add i32 %86, %8
  %88 = mul nsw i32 %87, 3
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %89
  store i8 0, i8 addrspace(1)* %90, align 1, !tbaa !16
  %91 = add nsw i32 %88, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %92
  store i8 0, i8 addrspace(1)* %93, align 1, !tbaa !16
  %94 = add nsw i32 %88, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %95
  store i8 0, i8 addrspace(1)* %96, align 1, !tbaa !16
  br i1 %26, label %97, label %139

97:                                               ; preds = %82
  %98 = sext i32 %87 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  br label %100

100:                                              ; preds = %100, %97
  %101 = phi i8 [ 0, %97 ], [ %136, %100 ]
  %102 = phi i8 [ 0, %97 ], [ %128, %100 ]
  %103 = phi i8 [ 0, %97 ], [ %120, %100 ]
  %104 = phi i32 [ 0, %97 ], [ %137, %100 ]
  %105 = mul nsw i32 %104, %5
  %106 = add nsw i32 %105, %87
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !19
  %110 = load float, float addrspace(1)* %99, align 4, !tbaa !19
  %111 = fdiv contract float %109, %110
  %112 = mul nsw i32 %105, 3
  %113 = add nsw i32 %112, %88
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %114
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !16
  %117 = uitofp i8 %116 to float
  %118 = fmul contract float %111, %117
  %119 = fptoui float %118 to i8
  %120 = add i8 %103, %119
  store i8 %120, i8 addrspace(1)* %90, align 1, !tbaa !16
  %121 = add nsw i32 %113, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %122
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !16
  %125 = uitofp i8 %124 to float
  %126 = fmul contract float %111, %125
  %127 = fptoui float %126 to i8
  %128 = add i8 %102, %127
  store i8 %128, i8 addrspace(1)* %93, align 1, !tbaa !16
  %129 = add nsw i32 %113, 2
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %130
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !16
  %133 = uitofp i8 %132 to float
  %134 = fmul contract float %111, %133
  %135 = fptoui float %134 to i8
  %136 = add i8 %101, %135
  store i8 %136, i8 addrspace(1)* %96, align 1, !tbaa !16
  %137 = add nuw nsw i32 %104, 1
  %138 = icmp eq i32 %137, %4
  br i1 %138, label %139, label %100, !llvm.loop !21

139:                                              ; preds = %100, %82
  %140 = add nsw i32 %12, 16
  %141 = mul i32 %140, %25
  %142 = add i32 %141, %7
  %143 = shl i32 %142, 5
  %144 = add i32 %143, %8
  %145 = mul nsw i32 %144, 3
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %146
  store i8 0, i8 addrspace(1)* %147, align 1, !tbaa !16
  %148 = add nsw i32 %145, 1
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %149
  store i8 0, i8 addrspace(1)* %150, align 1, !tbaa !16
  %151 = add nsw i32 %145, 2
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %152
  store i8 0, i8 addrspace(1)* %153, align 1, !tbaa !16
  br i1 %26, label %154, label %196

154:                                              ; preds = %139
  %155 = sext i32 %144 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %3, i64 %155
  br label %157

157:                                              ; preds = %157, %154
  %158 = phi i8 [ 0, %154 ], [ %193, %157 ]
  %159 = phi i8 [ 0, %154 ], [ %185, %157 ]
  %160 = phi i8 [ 0, %154 ], [ %177, %157 ]
  %161 = phi i32 [ 0, %154 ], [ %194, %157 ]
  %162 = mul nsw i32 %161, %5
  %163 = add nsw i32 %162, %144
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !19
  %167 = load float, float addrspace(1)* %156, align 4, !tbaa !19
  %168 = fdiv contract float %166, %167
  %169 = mul nsw i32 %162, 3
  %170 = add nsw i32 %169, %145
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %171
  %173 = load i8, i8 addrspace(1)* %172, align 1, !tbaa !16
  %174 = uitofp i8 %173 to float
  %175 = fmul contract float %168, %174
  %176 = fptoui float %175 to i8
  %177 = add i8 %160, %176
  store i8 %177, i8 addrspace(1)* %147, align 1, !tbaa !16
  %178 = add nsw i32 %170, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %179
  %181 = load i8, i8 addrspace(1)* %180, align 1, !tbaa !16
  %182 = uitofp i8 %181 to float
  %183 = fmul contract float %168, %182
  %184 = fptoui float %183 to i8
  %185 = add i8 %159, %184
  store i8 %185, i8 addrspace(1)* %150, align 1, !tbaa !16
  %186 = add nsw i32 %170, 2
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %187
  %189 = load i8, i8 addrspace(1)* %188, align 1, !tbaa !16
  %190 = uitofp i8 %189 to float
  %191 = fmul contract float %168, %190
  %192 = fptoui float %191 to i8
  %193 = add i8 %158, %192
  store i8 %193, i8 addrspace(1)* %153, align 1, !tbaa !16
  %194 = add nuw nsw i32 %161, 1
  %195 = icmp eq i32 %194, %4
  br i1 %195, label %196, label %157, !llvm.loop !21

196:                                              ; preds = %157, %139
  %197 = add nsw i32 %12, 24
  %198 = mul i32 %197, %25
  %199 = add i32 %198, %7
  %200 = shl i32 %199, 5
  %201 = add i32 %200, %8
  %202 = mul nsw i32 %201, 3
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %203
  store i8 0, i8 addrspace(1)* %204, align 1, !tbaa !16
  %205 = add nsw i32 %202, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %206
  store i8 0, i8 addrspace(1)* %207, align 1, !tbaa !16
  %208 = add nsw i32 %202, 2
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %209
  store i8 0, i8 addrspace(1)* %210, align 1, !tbaa !16
  br i1 %26, label %211, label %253

211:                                              ; preds = %196
  %212 = sext i32 %201 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %3, i64 %212
  br label %214

214:                                              ; preds = %214, %211
  %215 = phi i8 [ 0, %211 ], [ %250, %214 ]
  %216 = phi i8 [ 0, %211 ], [ %242, %214 ]
  %217 = phi i8 [ 0, %211 ], [ %234, %214 ]
  %218 = phi i32 [ 0, %211 ], [ %251, %214 ]
  %219 = mul nsw i32 %218, %5
  %220 = add nsw i32 %219, %201
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %2, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !19
  %224 = load float, float addrspace(1)* %213, align 4, !tbaa !19
  %225 = fdiv contract float %223, %224
  %226 = mul nsw i32 %219, 3
  %227 = add nsw i32 %226, %202
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %228
  %230 = load i8, i8 addrspace(1)* %229, align 1, !tbaa !16
  %231 = uitofp i8 %230 to float
  %232 = fmul contract float %225, %231
  %233 = fptoui float %232 to i8
  %234 = add i8 %217, %233
  store i8 %234, i8 addrspace(1)* %204, align 1, !tbaa !16
  %235 = add nsw i32 %227, 1
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %236
  %238 = load i8, i8 addrspace(1)* %237, align 1, !tbaa !16
  %239 = uitofp i8 %238 to float
  %240 = fmul contract float %225, %239
  %241 = fptoui float %240 to i8
  %242 = add i8 %216, %241
  store i8 %242, i8 addrspace(1)* %207, align 1, !tbaa !16
  %243 = add nsw i32 %227, 2
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %244
  %246 = load i8, i8 addrspace(1)* %245, align 1, !tbaa !16
  %247 = uitofp i8 %246 to float
  %248 = fmul contract float %225, %247
  %249 = fptoui float %248 to i8
  %250 = add i8 %215, %249
  store i8 %250, i8 addrspace(1)* %210, align 1, !tbaa !16
  %251 = add nuw nsw i32 %218, 1
  %252 = icmp eq i32 %251, %4
  br i1 %252, label %253, label %214, !llvm.loop !21

253:                                              ; preds = %214, %196
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !17, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
