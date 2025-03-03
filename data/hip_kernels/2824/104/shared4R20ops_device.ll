; ModuleID = '../data/hip_kernels/2824/104/main.cu'
source_filename = "../data/hip_kernels/2824/104/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13shared4R20opsPfS_S_iE4Smem = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13shared4R20opsPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %20

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R20opsPfS_S_iE4Smem, i32 0, i32 %12
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %21, label %66

21:                                               ; preds = %20
  %22 = sext i32 %13 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = fdiv contract float %24, 3.000000e+00
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = fmul contract float %27, 1.700000e+01
  %29 = fadd contract float %25, %28
  %30 = fmul contract float %24, %24
  %31 = fsub contract float %29, %30
  %32 = fmul contract float %27, 3.000000e+00
  %33 = fadd contract float %32, %31
  %34 = fmul contract float %24, 4.000000e+00
  %35 = fmul contract float %34, %27
  %36 = fsub contract float %33, %35
  %37 = fmul contract float %27, %27
  %38 = fmul contract float %37, 7.000000e+00
  %39 = fadd contract float %38, %36
  %40 = fadd contract float %39, -8.000000e+00
  %41 = add nuw nsw i32 %12, 1
  %42 = and i32 %41, 511
  %43 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R20opsPfS_S_iE4Smem, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %45 = fmul contract float %24, %44
  %46 = fadd contract float %45, %40
  %47 = add nuw nsw i32 %12, 2
  %48 = and i32 %47, 511
  %49 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R20opsPfS_S_iE4Smem, i32 0, i32 %48
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %51 = fmul contract float %50, 4.000000e+00
  %52 = fadd contract float %51, %46
  %53 = add nuw nsw i32 %12, 3
  %54 = and i32 %53, 511
  %55 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R20opsPfS_S_iE4Smem, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %57 = fmul contract float %32, %56
  %58 = fadd contract float %57, %52
  %59 = add nuw nsw i32 %12, 4
  %60 = and i32 %59, 511
  %61 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R20opsPfS_S_iE4Smem, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %63 = fmul contract float %24, %62
  %64 = fadd contract float %63, %58
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float %64, float addrspace(1)* %65, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %21, %20
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
