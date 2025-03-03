; ModuleID = '../data/hip_kernels/497/11/main.cu'
source_filename = "../data/hip_kernels/497/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_max = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12max_abs_diffPfPKfS1_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %25

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = fcmp contract oeq float %18, -1.000000e+00
  br i1 %19, label %25, label %20

20:                                               ; preds = %15
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = fsub contract float %18, %22
  %24 = tail call float @llvm.fabs.f32(float %23)
  br label %25

25:                                               ; preds = %4, %15, %20
  %26 = phi float [ %24, %20 ], [ -1.000000e+00, %15 ], [ -1.000000e+00, %4 ]
  %27 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_max, i32 0, i32 %12
  store float %26, float addrspace(3)* %27, align 4, !tbaa !7
  %28 = icmp ult i16 %8, 2
  br i1 %28, label %31, label %29

29:                                               ; preds = %25
  %30 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_max, i32 0, i32 %12
  br label %33

31:                                               ; preds = %43, %25
  %32 = icmp eq i32 %12, 0
  br i1 %32, label %45, label %49

33:                                               ; preds = %29, %43
  %34 = phi i32 [ %9, %29 ], [ %35, %43 ]
  %35 = lshr i32 %34, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp ult i32 %12, %35
  br i1 %36, label %37, label %43

37:                                               ; preds = %33
  %38 = load float, float addrspace(3)* %30, align 4, !tbaa !7
  %39 = add nuw nsw i32 %35, %12
  %40 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_max, i32 0, i32 %39
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %42 = tail call float @llvm.maxnum.f32(float %38, float %41)
  store float %42, float addrspace(3)* %30, align 4, !tbaa !7
  br label %43

43:                                               ; preds = %33, %37
  %44 = icmp ult i32 %34, 4
  br i1 %44, label %31, label %33, !llvm.loop !11

45:                                               ; preds = %31
  %46 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @s_max, i32 0, i32 0), align 4, !tbaa !7
  %47 = zext i32 %10 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %46, float addrspace(1)* %48, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %45, %31
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
