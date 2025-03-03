; ModuleID = '../data/hip_kernels/14434/2/main.cu'
source_filename = "../data/hip_kernels/14434/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19calculate_distancesPfS_iiS_S_PiiiiE11sweeper_pos = internal unnamed_addr addrspace(3) global [2 x float] undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19calculate_distancesPfS_iiS_S_Piiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = mul i32 %11, %3
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %13, 2
  br i1 %15, label %16, label %27

16:                                               ; preds = %10
  %17 = add i32 %11, %13
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ19calculate_distancesPfS_iiS_S_PiiiiE11sweeper_pos, i32 0, i32 %13
  store float %20, float addrspace(3)* %21, align 4, !tbaa !5
  %22 = shl i32 %11, 2
  %23 = add nuw nsw i32 %13, 2
  %24 = add nuw i32 %23, %22
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %5, i64 %25
  store float %20, float addrspace(1)* %26, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %16, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = shl nuw nsw i32 %13, 1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5
  %32 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ19calculate_distancesPfS_iiS_S_PiiiiE11sweeper_pos, i32 0, i32 0), align 4, !tbaa !5
  %33 = fsub contract float %31, %32
  %34 = add nuw nsw i32 %28, 1
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5
  %38 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ19calculate_distancesPfS_iiS_S_PiiiiE11sweeper_pos, i32 0, i32 1), align 4, !tbaa !5
  %39 = fsub contract float %37, %38
  %40 = fmul contract float %33, %33
  %41 = fmul contract float %39, %39
  %42 = fadd contract float %40, %41
  %43 = fcmp olt float %42, 0x39F0000000000000
  %44 = select i1 %43, float 0x41F0000000000000, float 1.000000e+00
  %45 = fmul float %42, %44
  %46 = tail call float @llvm.sqrt.f32(float %45)
  %47 = bitcast float %46 to i32
  %48 = add nsw i32 %47, -1
  %49 = bitcast i32 %48 to float
  %50 = add nsw i32 %47, 1
  %51 = bitcast i32 %50 to float
  %52 = tail call i1 @llvm.amdgcn.class.f32(float %45, i32 608)
  %53 = select i1 %43, float 0x3EF0000000000000, float 1.000000e+00
  %54 = fneg float %51
  %55 = tail call float @llvm.fma.f32(float %54, float %46, float %45)
  %56 = fcmp ogt float %55, 0.000000e+00
  %57 = fneg float %49
  %58 = tail call float @llvm.fma.f32(float %57, float %46, float %45)
  %59 = fcmp ole float %58, 0.000000e+00
  %60 = select i1 %59, float %49, float %46
  %61 = select i1 %56, float %51, float %60
  %62 = fmul float %53, %61
  %63 = select i1 %52, float %45, float %62
  %64 = sext i32 %14 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %4, i64 %64
  store float %63, float addrspace(1)* %65, align 4, !tbaa !5
  %66 = sitofp i32 %9 to float
  %67 = fcmp contract olt float %63, %66
  br i1 %67, label %68, label %85

68:                                               ; preds = %27
  %69 = add nuw nsw i32 %13, 1
  %70 = zext i32 %69 to i64
  %71 = tail call i64 @llvm.amdgcn.s.memtime()
  %72 = mul nsw i64 %71, %70
  %73 = sext i32 %7 to i64
  %74 = srem i64 %72, %73
  %75 = sitofp i64 %74 to float
  store float %75, float addrspace(1)* %30, align 4, !tbaa !5
  %76 = tail call i64 @llvm.amdgcn.s.memtime()
  %77 = mul nsw i64 %76, %70
  %78 = sext i32 %8 to i64
  %79 = srem i64 %77, %78
  %80 = sitofp i64 %79 to float
  store float %80, float addrspace(1)* %36, align 4, !tbaa !5
  %81 = zext i32 %11 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !10
  %84 = add nsw i32 %83, 1
  store i32 %84, i32 addrspace(1)* %82, align 4, !tbaa !10
  br label %85

85:                                               ; preds = %68, %27
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #4

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nounwind willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!"int", !7, i64 0}
