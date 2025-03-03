; ModuleID = '../data/hip_kernels/2357/33/main.cu'
source_filename = "../data/hip_kernels/2357/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12ZeroMeanImplPfiiE4beta = internal unnamed_addr addrspace(3) global [1000 x double] undef, align 16
@_ZZ12ZeroMeanImplPfiiE4line = internal unnamed_addr addrspace(3) global [1000 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12ZeroMeanImplPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = sdiv i32 1000, %1
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %4, %5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = freeze i32 %7
  %9 = freeze i32 %1
  %10 = udiv i32 %8, %9
  %11 = add i32 %6, %10
  %12 = add nsw i32 %1, -1
  %13 = and i32 %12, %8
  %14 = icmp slt i32 %11, %2
  br i1 %14, label %15, label %55

15:                                               ; preds = %3
  %16 = mul nsw i32 %11, %1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = icmp eq i32 %13, %12
  br i1 %19, label %25, label %20

20:                                               ; preds = %15
  %21 = zext i32 %13 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %18, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = fpext float %23 to double
  br label %25

25:                                               ; preds = %15, %20
  %26 = phi double [ %24, %20 ], [ 0.000000e+00, %15 ]
  %27 = getelementptr inbounds [1000 x double], [1000 x double] addrspace(3)* @_ZZ12ZeroMeanImplPfiiE4beta, i32 0, i32 %8
  store double %26, double addrspace(3)* %27, align 8, !tbaa !10
  %28 = getelementptr inbounds [1000 x double], [1000 x double] addrspace(3)* @_ZZ12ZeroMeanImplPfiiE4line, i32 0, i32 %8
  store double %26, double addrspace(3)* %28, align 8, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp sgt i32 %1, 1
  br i1 %29, label %43, label %30

30:                                               ; preds = %53, %25
  %31 = mul i32 %10, %9
  %32 = sub i32 %8, %31
  %33 = sub nuw i32 %8, %32
  %34 = getelementptr inbounds [1000 x double], [1000 x double] addrspace(3)* @_ZZ12ZeroMeanImplPfiiE4line, i32 0, i32 %33
  %35 = load double, double addrspace(3)* %34, align 8, !tbaa !10
  %36 = sitofp i32 %1 to double
  %37 = fdiv contract double %35, %36
  %38 = load double, double addrspace(3)* %27, align 8, !tbaa !10
  %39 = fsub contract double %38, %37
  store double %39, double addrspace(3)* %27, align 8, !tbaa !10
  %40 = fptrunc double %39 to float
  %41 = zext i32 %13 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %18, i64 %41
  store float %40, float addrspace(1)* %42, align 4, !tbaa !5
  br label %55

43:                                               ; preds = %25, %53
  %44 = phi i32 [ %45, %53 ], [ %1, %25 ]
  %45 = ashr i32 %44, 1
  %46 = icmp slt i32 %13, %45
  br i1 %46, label %47, label %53

47:                                               ; preds = %43
  %48 = add nsw i32 %45, %8
  %49 = getelementptr inbounds [1000 x double], [1000 x double] addrspace(3)* @_ZZ12ZeroMeanImplPfiiE4line, i32 0, i32 %48
  %50 = load double, double addrspace(3)* %49, align 8, !tbaa !10
  %51 = load double, double addrspace(3)* %28, align 8, !tbaa !10
  %52 = fadd contract double %50, %51
  store double %52, double addrspace(3)* %28, align 8, !tbaa !10
  br label %53

53:                                               ; preds = %47, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp sgt i32 %44, 3
  br i1 %54, label %43, label %30, !llvm.loop !12

55:                                               ; preds = %3, %30
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
