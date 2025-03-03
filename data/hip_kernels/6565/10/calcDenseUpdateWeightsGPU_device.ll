; ModuleID = '../data/hip_kernels/6565/10/main.cu'
source_filename = "../data/hip_kernels/6565/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25calcDenseUpdateWeightsGPUPfS_S_S_S_iiiiiiiff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, float %12, float %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !4
  %21 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %20, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %15
  %32 = mul i32 %31, %24
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = add i32 %32, %33
  %35 = icmp slt i32 %34, %9
  br i1 %35, label %36, label %240

36:                                               ; preds = %14
  %37 = mul nsw i32 %7, %6
  %38 = mul nsw i32 %37, %8
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %63

40:                                               ; preds = %36
  %41 = and i32 %38, 7
  %42 = icmp ult i32 %38, 8
  br i1 %42, label %45, label %43

43:                                               ; preds = %40
  %44 = and i32 %38, -8
  br label %77

45:                                               ; preds = %77, %40
  %46 = phi i32 [ 0, %40 ], [ %159, %77 ]
  %47 = icmp eq i32 %41, 0
  br i1 %47, label %63, label %48

48:                                               ; preds = %45, %48
  %49 = phi i32 [ %60, %48 ], [ %46, %45 ]
  %50 = phi i32 [ %61, %48 ], [ 0, %45 ]
  %51 = mul nsw i32 %49, %9
  %52 = add nsw i32 %51, %34
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = fmul contract float %57, %12
  %59 = fsub contract float %55, %58
  store float %59, float addrspace(1)* %54, align 4, !tbaa !16
  %60 = add nuw nsw i32 %49, 1
  %61 = add i32 %50, 1
  %62 = icmp eq i32 %61, %41
  br i1 %62, label %63, label %48, !llvm.loop !20

63:                                               ; preds = %45, %48, %36
  %64 = sext i32 %34 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = getelementptr inbounds float, float addrspace(1)* %4, i64 %64
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = fmul contract float %68, %12
  %70 = fsub contract float %66, %69
  store float %70, float addrspace(1)* %65, align 4, !tbaa !16
  %71 = icmp sgt i32 %5, 0
  br i1 %71, label %72, label %240

72:                                               ; preds = %63
  %73 = and i32 %5, 3
  %74 = icmp ult i32 %5, 4
  br i1 %74, label %219, label %75

75:                                               ; preds = %72
  %76 = and i32 %5, -4
  br label %162

77:                                               ; preds = %77, %43
  %78 = phi i32 [ 0, %43 ], [ %159, %77 ]
  %79 = phi i32 [ 0, %43 ], [ %160, %77 ]
  %80 = mul nsw i32 %78, %9
  %81 = add nsw i32 %80, %34
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %82
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fmul contract float %86, %12
  %88 = fsub contract float %84, %87
  store float %88, float addrspace(1)* %83, align 4, !tbaa !16
  %89 = or i32 %78, 1
  %90 = mul nsw i32 %89, %9
  %91 = add nsw i32 %90, %34
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fmul contract float %96, %12
  %98 = fsub contract float %94, %97
  store float %98, float addrspace(1)* %93, align 4, !tbaa !16
  %99 = or i32 %78, 2
  %100 = mul nsw i32 %99, %9
  %101 = add nsw i32 %100, %34
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fmul contract float %106, %12
  %108 = fsub contract float %104, %107
  store float %108, float addrspace(1)* %103, align 4, !tbaa !16
  %109 = or i32 %78, 3
  %110 = mul nsw i32 %109, %9
  %111 = add nsw i32 %110, %34
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = getelementptr inbounds float, float addrspace(1)* %3, i64 %112
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  %117 = fmul contract float %116, %12
  %118 = fsub contract float %114, %117
  store float %118, float addrspace(1)* %113, align 4, !tbaa !16
  %119 = or i32 %78, 4
  %120 = mul nsw i32 %119, %9
  %121 = add nsw i32 %120, %34
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = getelementptr inbounds float, float addrspace(1)* %3, i64 %122
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = fmul contract float %126, %12
  %128 = fsub contract float %124, %127
  store float %128, float addrspace(1)* %123, align 4, !tbaa !16
  %129 = or i32 %78, 5
  %130 = mul nsw i32 %129, %9
  %131 = add nsw i32 %130, %34
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fmul contract float %136, %12
  %138 = fsub contract float %134, %137
  store float %138, float addrspace(1)* %133, align 4, !tbaa !16
  %139 = or i32 %78, 6
  %140 = mul nsw i32 %139, %9
  %141 = add nsw i32 %140, %34
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16
  %145 = getelementptr inbounds float, float addrspace(1)* %3, i64 %142
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = fmul contract float %146, %12
  %148 = fsub contract float %144, %147
  store float %148, float addrspace(1)* %143, align 4, !tbaa !16
  %149 = or i32 %78, 7
  %150 = mul nsw i32 %149, %9
  %151 = add nsw i32 %150, %34
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !16
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = fmul contract float %156, %12
  %158 = fsub contract float %154, %157
  store float %158, float addrspace(1)* %153, align 4, !tbaa !16
  %159 = add nuw nsw i32 %78, 8
  %160 = add i32 %79, 8
  %161 = icmp eq i32 %160, %44
  br i1 %161, label %45, label %77, !llvm.loop !22

162:                                              ; preds = %162, %75
  %163 = phi i32 [ 0, %75 ], [ %216, %162 ]
  %164 = phi i32 [ 0, %75 ], [ %217, %162 ]
  %165 = mul nsw i32 %163, %9
  %166 = add nsw i32 %165, %34
  %167 = shl nsw i32 %166, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !16
  %171 = add nuw nsw i32 %167, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = fmul contract float %174, %13
  %176 = fadd contract float %170, %175
  store float %176, float addrspace(1)* %173, align 4, !tbaa !16
  %177 = or i32 %163, 1
  %178 = mul nsw i32 %177, %9
  %179 = add nsw i32 %178, %34
  %180 = shl nsw i32 %179, 1
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %2, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !16
  %184 = add nuw nsw i32 %180, 1
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %2, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !16
  %188 = fmul contract float %187, %13
  %189 = fadd contract float %183, %188
  store float %189, float addrspace(1)* %186, align 4, !tbaa !16
  %190 = or i32 %163, 2
  %191 = mul nsw i32 %190, %9
  %192 = add nsw i32 %191, %34
  %193 = shl nsw i32 %192, 1
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !16
  %197 = add nuw nsw i32 %193, 1
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %2, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !16
  %201 = fmul contract float %200, %13
  %202 = fadd contract float %196, %201
  store float %202, float addrspace(1)* %199, align 4, !tbaa !16
  %203 = or i32 %163, 3
  %204 = mul nsw i32 %203, %9
  %205 = add nsw i32 %204, %34
  %206 = shl nsw i32 %205, 1
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %2, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !16
  %210 = add nuw nsw i32 %206, 1
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %2, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !16
  %214 = fmul contract float %213, %13
  %215 = fadd contract float %209, %214
  store float %215, float addrspace(1)* %212, align 4, !tbaa !16
  %216 = add nuw nsw i32 %163, 4
  %217 = add i32 %164, 4
  %218 = icmp eq i32 %217, %76
  br i1 %218, label %219, label %162, !llvm.loop !24

219:                                              ; preds = %162, %72
  %220 = phi i32 [ 0, %72 ], [ %216, %162 ]
  %221 = icmp eq i32 %73, 0
  br i1 %221, label %240, label %222

222:                                              ; preds = %219, %222
  %223 = phi i32 [ %237, %222 ], [ %220, %219 ]
  %224 = phi i32 [ %238, %222 ], [ 0, %219 ]
  %225 = mul nsw i32 %223, %9
  %226 = add nsw i32 %225, %34
  %227 = shl nsw i32 %226, 1
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %2, i64 %228
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !16
  %231 = add nuw nsw i32 %227, 1
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %2, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !16
  %235 = fmul contract float %234, %13
  %236 = fadd contract float %230, %235
  store float %236, float addrspace(1)* %233, align 4, !tbaa !16
  %237 = add nuw nsw i32 %223, 1
  %238 = add i32 %224, 1
  %239 = icmp eq i32 %238, %73
  br i1 %239, label %240, label %222, !llvm.loop !25

240:                                              ; preds = %219, %222, %63, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !21}
