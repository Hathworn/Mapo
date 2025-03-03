; ModuleID = '../data/hip_kernels/1738/8/main.cu'
source_filename = "../data/hip_kernels/1738/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9maxKernelPfiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 1
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %4
  %17 = shl nuw nsw i32 %11, 1
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %17, %22
  %24 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  store float 0.000000e+00, float addrspace(3)* %24, align 4, !tbaa !16
  %25 = icmp ult i32 %16, %1
  br i1 %25, label %28, label %26

26:                                               ; preds = %28, %3
  %27 = icmp ugt i16 %10, 65
  br i1 %27, label %42, label %40

28:                                               ; preds = %3, %28
  %29 = phi i32 [ %38, %28 ], [ %16, %3 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %33 = add i32 %29, %11
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = tail call float @llvm.maxnum.f32(float %32, float %36)
  store float %37, float addrspace(3)* %24, align 4, !tbaa !16
  %38 = add i32 %29, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i32 %38, %1
  br i1 %39, label %28, label %26, !llvm.loop !20

40:                                               ; preds = %52, %26
  %41 = icmp ult i32 %4, 32
  br i1 %41, label %54, label %85

42:                                               ; preds = %26, %52
  %43 = phi i32 [ %44, %52 ], [ %11, %26 ]
  %44 = lshr i32 %43, 1
  %45 = icmp ult i32 %4, %44
  br i1 %45, label %46, label %52

46:                                               ; preds = %42
  %47 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %48 = add nuw nsw i32 %44, %4
  %49 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %48
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !16
  %51 = tail call float @llvm.maxnum.f32(float %47, float %50)
  store float %51, float addrspace(3)* %24, align 4, !tbaa !16
  br label %52

52:                                               ; preds = %46, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp ugt i32 %43, 131
  br i1 %53, label %42, label %40, !llvm.loop !22

54:                                               ; preds = %40
  %55 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %56 = add nuw nsw i32 %4, 32
  %57 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !16
  %59 = tail call float @llvm.maxnum.f32(float %55, float %58)
  store float %59, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %61 = add nuw nsw i32 %4, 16
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !16
  %64 = tail call float @llvm.maxnum.f32(float %60, float %63)
  store float %64, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %66 = add nuw nsw i32 %4, 8
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !16
  %69 = tail call float @llvm.maxnum.f32(float %65, float %68)
  store float %69, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %71 = add nuw nsw i32 %4, 4
  %72 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %71
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !16
  %74 = tail call float @llvm.maxnum.f32(float %70, float %73)
  store float %74, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %76 = add nuw nsw i32 %4, 2
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !16
  %79 = tail call float @llvm.maxnum.f32(float %75, float %78)
  store float %79, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = load float, float addrspace(3)* %24, align 4, !tbaa !16
  %81 = add nuw nsw i32 %4, 1
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !16
  %84 = tail call float @llvm.maxnum.f32(float %80, float %83)
  store float %84, float addrspace(3)* %24, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %85

85:                                               ; preds = %54, %40
  %86 = icmp eq i32 %4, 0
  br i1 %86, label %87, label %91

87:                                               ; preds = %85
  %88 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  %89 = zext i32 %5 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  store float %88, float addrspace(1)* %90, align 4, !tbaa !16
  br label %91

91:                                               ; preds = %87, %85
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

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
