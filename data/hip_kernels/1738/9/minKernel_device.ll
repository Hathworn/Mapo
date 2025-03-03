; ModuleID = '../data/hip_kernels/1738/9/main.cu'
source_filename = "../data/hip_kernels/1738/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9minKernelPfiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
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
  %24 = icmp ult i32 %16, %1
  br i1 %24, label %25, label %27

25:                                               ; preds = %3
  %26 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  br label %31

27:                                               ; preds = %31, %3
  %28 = icmp ugt i16 %10, 65
  br i1 %28, label %29, label %43

29:                                               ; preds = %27
  %30 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  br label %45

31:                                               ; preds = %25, %31
  %32 = phi i32 [ %16, %25 ], [ %41, %31 ]
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !6
  %36 = add i32 %32, %11
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !6
  %40 = tail call float @llvm.minnum.f32(float %35, float %39)
  store float %40, float addrspace(3)* %26, align 4, !tbaa !16
  %41 = add i32 %32, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp ult i32 %41, %1
  br i1 %42, label %31, label %27, !llvm.loop !20

43:                                               ; preds = %55, %27
  %44 = icmp ult i32 %4, 32
  br i1 %44, label %57, label %89

45:                                               ; preds = %29, %55
  %46 = phi i32 [ %11, %29 ], [ %47, %55 ]
  %47 = lshr i32 %46, 1
  %48 = icmp ult i32 %4, %47
  br i1 %48, label %49, label %55

49:                                               ; preds = %45
  %50 = load float, float addrspace(3)* %30, align 4, !tbaa !16
  %51 = add nuw nsw i32 %47, %4
  %52 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !16
  %54 = tail call float @llvm.minnum.f32(float %50, float %53)
  store float %54, float addrspace(3)* %30, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %49, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ugt i32 %46, 131
  br i1 %56, label %45, label %43, !llvm.loop !22

57:                                               ; preds = %43
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %60 = add nuw nsw i32 %4, 32
  %61 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !16
  %63 = tail call float @llvm.minnum.f32(float %59, float %62)
  store float %63, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %65 = add nuw nsw i32 %4, 16
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %65
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !16
  %68 = tail call float @llvm.minnum.f32(float %64, float %67)
  store float %68, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %70 = add nuw nsw i32 %4, 8
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !16
  %73 = tail call float @llvm.minnum.f32(float %69, float %72)
  store float %73, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %75 = add nuw nsw i32 %4, 4
  %76 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !16
  %78 = tail call float @llvm.minnum.f32(float %74, float %77)
  store float %78, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %80 = add nuw nsw i32 %4, 2
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !16
  %83 = tail call float @llvm.minnum.f32(float %79, float %82)
  store float %83, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %85 = add nuw nsw i32 %4, 1
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !16
  %88 = tail call float @llvm.minnum.f32(float %84, float %87)
  store float %88, float addrspace(3)* %58, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %89

89:                                               ; preds = %57, %43
  %90 = icmp eq i32 %4, 0
  br i1 %90, label %91, label %95

91:                                               ; preds = %89
  %92 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  %93 = zext i32 %5 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  store float %92, float addrspace(1)* %94, align 4, !tbaa !16
  br label %95

95:                                               ; preds = %91, %89
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

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
