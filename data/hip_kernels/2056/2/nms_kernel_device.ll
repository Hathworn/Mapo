; ModuleID = '../data/hip_kernels/2056/2/main.cu'
source_filename = "../data/hip_kernels/2056/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10nms_kernelifiPKiPfPKfPK15HIP_vector_typeIfLj4EE(i32 %0, float %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, %struct.HIP_vector_type addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %9, label %19

9:                                                ; preds = %7
  %10 = icmp sgt i32 %0, 0
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %12 = mul i32 %11, %0
  br label %13

13:                                               ; preds = %9, %20
  %14 = phi i32 [ 0, %9 ], [ %21, %20 ]
  br i1 %10, label %15, label %20

15:                                               ; preds = %13
  %16 = zext i32 %14 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %4, i64 %16
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %16
  br label %23

19:                                               ; preds = %20, %7
  ret void

20:                                               ; preds = %90, %13
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = add nuw nsw i32 %14, 1
  %22 = icmp eq i32 %21, %2
  br i1 %22, label %19, label %13, !llvm.loop !4

23:                                               ; preds = %15, %90
  %24 = phi i32 [ 0, %15 ], [ %91, %90 ]
  %25 = add i32 %24, %12
  %26 = icmp slt i32 %25, %2
  %27 = icmp slt i32 %14, %25
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %90

29:                                               ; preds = %23
  %30 = load float, float addrspace(1)* %17, align 4, !tbaa !6
  %31 = fcmp contract ogt float %30, 0.000000e+00
  br i1 %31, label %32, label %90

32:                                               ; preds = %29
  %33 = sext i32 %25 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !10, !amdgpu.noclobber !12
  %36 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !10, !amdgpu.noclobber !12
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !6
  %40 = fptosi float %39 to i32
  %41 = sext i32 %36 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %5, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !6
  %44 = fptosi float %43 to i32
  %45 = icmp eq i32 %44, %40
  br i1 %45, label %46, label %90

46:                                               ; preds = %32
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %37, i32 0, i32 0, i32 0, i64 0
  %48 = load float, float addrspace(1)* %47, align 16
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %37, i32 0, i32 0, i32 0, i64 1
  %50 = load float, float addrspace(1)* %49, align 4
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %37, i32 0, i32 0, i32 0, i64 2
  %52 = load float, float addrspace(1)* %51, align 8
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %37, i32 0, i32 0, i32 0, i64 3
  %54 = load float, float addrspace(1)* %53, align 4
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %41, i32 0, i32 0, i32 0, i64 0
  %56 = load float, float addrspace(1)* %55, align 16
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %41, i32 0, i32 0, i32 0, i64 1
  %58 = load float, float addrspace(1)* %57, align 4
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %41, i32 0, i32 0, i32 0, i64 2
  %60 = load float, float addrspace(1)* %59, align 8
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %41, i32 0, i32 0, i32 0, i64 3
  %62 = load float, float addrspace(1)* %61, align 4
  %63 = tail call float @llvm.maxnum.f32(float %48, float %56)
  %64 = tail call float @llvm.maxnum.f32(float %50, float %58)
  %65 = tail call float @llvm.minnum.f32(float %52, float %60)
  %66 = tail call float @llvm.minnum.f32(float %54, float %62)
  %67 = fsub contract float %65, %63
  %68 = fadd contract float %67, 1.000000e+00
  %69 = tail call float @llvm.maxnum.f32(float %68, float 0.000000e+00)
  %70 = fsub contract float %66, %64
  %71 = fadd contract float %70, 1.000000e+00
  %72 = tail call float @llvm.maxnum.f32(float %71, float 0.000000e+00)
  %73 = fsub contract float %52, %48
  %74 = fadd contract float %73, 1.000000e+00
  %75 = fsub contract float %54, %50
  %76 = fadd contract float %75, 1.000000e+00
  %77 = fmul contract float %74, %76
  %78 = fsub contract float %60, %56
  %79 = fadd contract float %78, 1.000000e+00
  %80 = fsub contract float %62, %58
  %81 = fadd contract float %80, 1.000000e+00
  %82 = fmul contract float %79, %81
  %83 = fmul contract float %69, %72
  %84 = fadd contract float %77, %82
  %85 = fsub contract float %84, %83
  %86 = fdiv contract float %83, %85
  %87 = fcmp contract ogt float %86, %1
  br i1 %87, label %88, label %90

88:                                               ; preds = %46
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %33
  store float 0.000000e+00, float addrspace(1)* %89, align 4, !tbaa !6
  br label %90

90:                                               ; preds = %32, %88, %46, %29, %23
  %91 = add nuw nsw i32 %24, 1
  %92 = icmp eq i32 %91, %0
  br i1 %92, label %20, label %23, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{}
!13 = distinct !{!13, !5}
