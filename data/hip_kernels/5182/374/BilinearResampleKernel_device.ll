; ModuleID = '../data/hip_kernels/5182/374/main.cu'
source_filename = "../data/hip_kernels/5182/374/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22BilinearResampleKernelPfS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %16
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %15
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %23
  %27 = mul nsw i32 %5, %4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %107

29:                                               ; preds = %6
  %30 = freeze i32 %26
  %31 = freeze i32 %4
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = add nsw i32 %2, -1
  %36 = sitofp i32 %35 to float
  %37 = add nsw i32 %4, -1
  %38 = sitofp i32 %37 to float
  %39 = fdiv contract float %36, %38
  %40 = add nsw i32 %3, -1
  %41 = sitofp i32 %40 to float
  %42 = add nsw i32 %5, -1
  %43 = sitofp i32 %42 to float
  %44 = fdiv contract float %41, %43
  %45 = sitofp i32 %34 to float
  %46 = fmul contract float %39, %45
  %47 = sitofp i32 %32 to float
  %48 = fmul contract float %44, %47
  %49 = tail call float @llvm.floor.f32(float %46)
  %50 = fptosi float %49 to i32
  %51 = tail call float @llvm.ceil.f32(float %46)
  %52 = fptosi float %51 to i32
  %53 = tail call float @llvm.floor.f32(float %48)
  %54 = fptosi float %53 to i32
  %55 = tail call float @llvm.ceil.f32(float %48)
  %56 = fptosi float %55 to i32
  %57 = sitofp i32 %50 to float
  %58 = fsub contract float %57, %46
  %59 = fadd contract float %58, 1.000000e+00
  %60 = sitofp i32 %52 to float
  %61 = fsub contract float %46, %60
  %62 = fadd contract float %61, 1.000000e+00
  %63 = sitofp i32 %54 to float
  %64 = fsub contract float %63, %48
  %65 = fadd contract float %64, 1.000000e+00
  %66 = sitofp i32 %56 to float
  %67 = fsub contract float %48, %66
  %68 = fadd contract float %67, 1.000000e+00
  %69 = mul nsw i32 %54, %2
  %70 = add nsw i32 %69, %50
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16, !amdgpu.noclobber !5
  %74 = mul nsw i32 %56, %2
  %75 = add nsw i32 %74, %50
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !5
  %79 = icmp eq i32 %50, %52
  br i1 %79, label %95, label %80

80:                                               ; preds = %29
  %81 = add nsw i32 %74, %52
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !5
  %85 = add nsw i32 %69, %52
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16, !amdgpu.noclobber !5
  %89 = fmul contract float %73, %59
  %90 = fmul contract float %62, %88
  %91 = fadd contract float %89, %90
  %92 = fmul contract float %78, %59
  %93 = fmul contract float %62, %84
  %94 = fadd contract float %92, %93
  br label %95

95:                                               ; preds = %29, %80
  %96 = phi float [ %94, %80 ], [ %78, %29 ]
  %97 = phi float [ %91, %80 ], [ %73, %29 ]
  %98 = icmp eq i32 %54, %56
  %99 = fmul contract float %65, %97
  %100 = fmul contract float %68, %96
  %101 = fadd contract float %100, %99
  %102 = select i1 %98, float %97, float %101
  %103 = mul nsw i32 %32, %4
  %104 = add nsw i32 %103, %34
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  store float %102, float addrspace(1)* %106, align 4, !tbaa !16
  br label %107

107:                                              ; preds = %95, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
