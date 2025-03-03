; ModuleID = '../data/hip_kernels/1738/7/main.cu'
source_filename = "../data/hip_kernels/1738/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9ladKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = shl nuw nsw i32 %11, 1
  %16 = mul i32 %15, %6
  %17 = add i32 %16, %5
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %15
  %24 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %5
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !16
  %25 = icmp ult i32 %17, %3
  br i1 %25, label %28, label %26

26:                                               ; preds = %28, %4
  %27 = icmp ugt i16 %10, 65
  br i1 %27, label %52, label %50

28:                                               ; preds = %4, %28
  %29 = phi i32 [ %48, %28 ], [ %17, %4 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %35 = fsub contract float %32, %34
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = add i32 %29, %11
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16
  %43 = fsub contract float %40, %42
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fadd contract float %36, %44
  %46 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %47 = fadd contract float %46, %45
  store float %47, float addrspace(3)* %24, align 4, !tbaa !16
  %48 = add i32 %29, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %48, %3
  br i1 %49, label %28, label %26, !llvm.loop !20

50:                                               ; preds = %62, %26
  %51 = icmp ult i32 %5, 32
  br i1 %51, label %64, label %95

52:                                               ; preds = %26, %62
  %53 = phi i32 [ %54, %62 ], [ %11, %26 ]
  %54 = lshr i32 %53, 1
  %55 = icmp ult i32 %5, %54
  br i1 %55, label %56, label %62

56:                                               ; preds = %52
  %57 = add nuw nsw i32 %54, %5
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %60 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(3)* %24, align 4, !tbaa !16
  br label %62

62:                                               ; preds = %56, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ugt i32 %53, 131
  br i1 %63, label %52, label %50, !llvm.loop !22

64:                                               ; preds = %50
  %65 = add nuw nsw i32 %5, 32
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %65
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !16
  %68 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %69 = fadd contract float %67, %68
  store float %69, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = add nuw nsw i32 %5, 16
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !16
  %73 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %74 = fadd contract float %72, %73
  store float %74, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = add nuw nsw i32 %5, 8
  %76 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !16
  %78 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = add nuw nsw i32 %5, 4
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !16
  %83 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %84 = fadd contract float %82, %83
  store float %84, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = add nuw nsw i32 %5, 2
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !16
  %88 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %89 = fadd contract float %87, %88
  store float %89, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = add nuw nsw i32 %5, 1
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !16
  %93 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %94 = fadd contract float %92, %93
  store float %94, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %95

95:                                               ; preds = %64, %50
  %96 = icmp eq i32 %5, 0
  br i1 %96, label %97, label %101

97:                                               ; preds = %95
  %98 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  %99 = zext i32 %6 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  store float %98, float addrspace(1)* %100, align 4, !tbaa !16
  br label %101

101:                                              ; preds = %97, %95
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
