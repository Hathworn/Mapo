; ModuleID = '../data/hip_kernels/1426/1/main.cu'
source_filename = "../data/hip_kernels/1426/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21binarize_input_kernelPfiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = mul i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %26, label %226

26:                                               ; preds = %4
  %27 = icmp sgt i32 %1, 0
  br i1 %27, label %28, label %122

28:                                               ; preds = %26
  %29 = and i32 %1, 7
  %30 = icmp ult i32 %1, 8
  br i1 %30, label %103, label %31

31:                                               ; preds = %28
  %32 = and i32 %1, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi float [ 0.000000e+00, %31 ], [ %99, %33 ]
  %35 = phi i32 [ 0, %31 ], [ %100, %33 ]
  %36 = phi i32 [ 0, %31 ], [ %101, %33 ]
  %37 = mul nsw i32 %35, %2
  %38 = add nsw i32 %37, %24
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !14
  %42 = tail call float @llvm.fabs.f32(float %41)
  %43 = fadd contract float %34, %42
  %44 = or i32 %35, 1
  %45 = mul nsw i32 %44, %2
  %46 = add nsw i32 %45, %24
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !14
  %50 = tail call float @llvm.fabs.f32(float %49)
  %51 = fadd contract float %43, %50
  %52 = or i32 %35, 2
  %53 = mul nsw i32 %52, %2
  %54 = add nsw i32 %53, %24
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16, !amdgpu.noclobber !14
  %58 = tail call float @llvm.fabs.f32(float %57)
  %59 = fadd contract float %51, %58
  %60 = or i32 %35, 3
  %61 = mul nsw i32 %60, %2
  %62 = add nsw i32 %61, %24
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !14
  %66 = tail call float @llvm.fabs.f32(float %65)
  %67 = fadd contract float %59, %66
  %68 = or i32 %35, 4
  %69 = mul nsw i32 %68, %2
  %70 = add nsw i32 %69, %24
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16, !amdgpu.noclobber !14
  %74 = tail call float @llvm.fabs.f32(float %73)
  %75 = fadd contract float %67, %74
  %76 = or i32 %35, 5
  %77 = mul nsw i32 %76, %2
  %78 = add nsw i32 %77, %24
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !14
  %82 = tail call float @llvm.fabs.f32(float %81)
  %83 = fadd contract float %75, %82
  %84 = or i32 %35, 6
  %85 = mul nsw i32 %84, %2
  %86 = add nsw i32 %85, %24
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16, !amdgpu.noclobber !14
  %90 = tail call float @llvm.fabs.f32(float %89)
  %91 = fadd contract float %83, %90
  %92 = or i32 %35, 7
  %93 = mul nsw i32 %92, %2
  %94 = add nsw i32 %93, %24
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16, !amdgpu.noclobber !14
  %98 = tail call float @llvm.fabs.f32(float %97)
  %99 = fadd contract float %91, %98
  %100 = add nuw nsw i32 %35, 8
  %101 = add i32 %36, 8
  %102 = icmp eq i32 %101, %32
  br i1 %102, label %103, label %33, !llvm.loop !20

103:                                              ; preds = %33, %28
  %104 = phi float [ undef, %28 ], [ %99, %33 ]
  %105 = phi float [ 0.000000e+00, %28 ], [ %99, %33 ]
  %106 = phi i32 [ 0, %28 ], [ %100, %33 ]
  %107 = icmp eq i32 %29, 0
  br i1 %107, label %122, label %108

108:                                              ; preds = %103, %108
  %109 = phi float [ %118, %108 ], [ %105, %103 ]
  %110 = phi i32 [ %119, %108 ], [ %106, %103 ]
  %111 = phi i32 [ %120, %108 ], [ 0, %103 ]
  %112 = mul nsw i32 %110, %2
  %113 = add nsw i32 %112, %24
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16, !amdgpu.noclobber !14
  %117 = tail call float @llvm.fabs.f32(float %116)
  %118 = fadd contract float %109, %117
  %119 = add nuw nsw i32 %110, 1
  %120 = add i32 %111, 1
  %121 = icmp eq i32 %120, %29
  br i1 %121, label %122, label %108, !llvm.loop !22

122:                                              ; preds = %103, %108, %26
  %123 = phi float [ 0.000000e+00, %26 ], [ %104, %103 ], [ %118, %108 ]
  %124 = sitofp i32 %1 to float
  %125 = fdiv contract float %123, %124
  br i1 %27, label %126, label %226

126:                                              ; preds = %122
  %127 = fneg contract float %125
  %128 = and i32 %1, 7
  %129 = icmp ult i32 %1, 8
  br i1 %129, label %209, label %130

130:                                              ; preds = %126
  %131 = and i32 %1, -8
  br label %132

132:                                              ; preds = %132, %130
  %133 = phi i32 [ 0, %130 ], [ %206, %132 ]
  %134 = phi i32 [ 0, %130 ], [ %207, %132 ]
  %135 = mul nsw i32 %133, %2
  %136 = add nsw i32 %135, %24
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fcmp contract ogt float %139, 0.000000e+00
  %141 = select contract i1 %140, float %125, float %127
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %137
  store float %141, float addrspace(1)* %142, align 4, !tbaa !16
  %143 = or i32 %133, 1
  %144 = mul nsw i32 %143, %2
  %145 = add nsw i32 %144, %24
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fcmp contract ogt float %148, 0.000000e+00
  %150 = select contract i1 %149, float %125, float %127
  %151 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  store float %150, float addrspace(1)* %151, align 4, !tbaa !16
  %152 = or i32 %133, 2
  %153 = mul nsw i32 %152, %2
  %154 = add nsw i32 %153, %24
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !16
  %158 = fcmp contract ogt float %157, 0.000000e+00
  %159 = select contract i1 %158, float %125, float %127
  %160 = getelementptr inbounds float, float addrspace(1)* %3, i64 %155
  store float %159, float addrspace(1)* %160, align 4, !tbaa !16
  %161 = or i32 %133, 3
  %162 = mul nsw i32 %161, %2
  %163 = add nsw i32 %162, %24
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !16
  %167 = fcmp contract ogt float %166, 0.000000e+00
  %168 = select contract i1 %167, float %125, float %127
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %164
  store float %168, float addrspace(1)* %169, align 4, !tbaa !16
  %170 = or i32 %133, 4
  %171 = mul nsw i32 %170, %2
  %172 = add nsw i32 %171, %24
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !16
  %176 = fcmp contract ogt float %175, 0.000000e+00
  %177 = select contract i1 %176, float %125, float %127
  %178 = getelementptr inbounds float, float addrspace(1)* %3, i64 %173
  store float %177, float addrspace(1)* %178, align 4, !tbaa !16
  %179 = or i32 %133, 5
  %180 = mul nsw i32 %179, %2
  %181 = add nsw i32 %180, %24
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %0, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !16
  %185 = fcmp contract ogt float %184, 0.000000e+00
  %186 = select contract i1 %185, float %125, float %127
  %187 = getelementptr inbounds float, float addrspace(1)* %3, i64 %182
  store float %186, float addrspace(1)* %187, align 4, !tbaa !16
  %188 = or i32 %133, 6
  %189 = mul nsw i32 %188, %2
  %190 = add nsw i32 %189, %24
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !16
  %194 = fcmp contract ogt float %193, 0.000000e+00
  %195 = select contract i1 %194, float %125, float %127
  %196 = getelementptr inbounds float, float addrspace(1)* %3, i64 %191
  store float %195, float addrspace(1)* %196, align 4, !tbaa !16
  %197 = or i32 %133, 7
  %198 = mul nsw i32 %197, %2
  %199 = add nsw i32 %198, %24
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %0, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !16
  %203 = fcmp contract ogt float %202, 0.000000e+00
  %204 = select contract i1 %203, float %125, float %127
  %205 = getelementptr inbounds float, float addrspace(1)* %3, i64 %200
  store float %204, float addrspace(1)* %205, align 4, !tbaa !16
  %206 = add nuw nsw i32 %133, 8
  %207 = add i32 %134, 8
  %208 = icmp eq i32 %207, %131
  br i1 %208, label %209, label %132, !llvm.loop !24

209:                                              ; preds = %132, %126
  %210 = phi i32 [ 0, %126 ], [ %206, %132 ]
  %211 = icmp eq i32 %128, 0
  br i1 %211, label %226, label %212

212:                                              ; preds = %209, %212
  %213 = phi i32 [ %223, %212 ], [ %210, %209 ]
  %214 = phi i32 [ %224, %212 ], [ 0, %209 ]
  %215 = mul nsw i32 %213, %2
  %216 = add nsw i32 %215, %24
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %0, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !16
  %220 = fcmp contract ogt float %219, 0.000000e+00
  %221 = select contract i1 %220, float %125, float %127
  %222 = getelementptr inbounds float, float addrspace(1)* %3, i64 %217
  store float %221, float addrspace(1)* %222, align 4, !tbaa !16
  %223 = add nuw nsw i32 %213, 1
  %224 = add i32 %214, 1
  %225 = icmp eq i32 %224, %128
  br i1 %225, label %226, label %212, !llvm.loop !25

226:                                              ; preds = %209, %212, %122, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
