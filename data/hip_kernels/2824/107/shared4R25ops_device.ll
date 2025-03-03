; ModuleID = '../data/hip_kernels/2824/107/main.cu'
source_filename = "../data/hip_kernels/2824/107/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13shared4R25opsPfS_S_iE4Smem = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13shared4R25opsPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
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
  %19 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R25opsPfS_S_iE4Smem, i32 0, i32 %12
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %21, label %70

21:                                               ; preds = %20
  %22 = sext i32 %13 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = fpext float %24 to double
  %26 = fmul contract double %25, 0x3FC9F267068A55EC
  %27 = fptrunc double %26 to float
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = fdiv contract float %29, 3.000000e+00
  %31 = fmul contract float %24, 1.700000e+01
  %32 = fadd contract float %31, %30
  %33 = fmul contract float %29, %29
  %34 = fsub contract float %32, %33
  %35 = fmul contract float %24, 3.000000e+00
  %36 = fadd contract float %35, %34
  %37 = fmul contract float %29, 4.000000e+00
  %38 = fmul contract float %24, %37
  %39 = fsub contract float %36, %38
  %40 = fmul contract float %24, %24
  %41 = fmul contract float %40, 7.000000e+00
  %42 = fadd contract float %41, %39
  %43 = fadd contract float %42, %27
  %44 = fadd contract float %43, -8.000000e+00
  %45 = add nuw nsw i32 %12, 1
  %46 = and i32 %45, 511
  %47 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R25opsPfS_S_iE4Smem, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %49 = fmul contract float %29, %48
  %50 = fadd contract float %49, %44
  %51 = add nuw nsw i32 %12, 2
  %52 = and i32 %51, 511
  %53 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R25opsPfS_S_iE4Smem, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = fmul contract float %54, 4.000000e+00
  %56 = fadd contract float %55, %50
  %57 = add nuw nsw i32 %12, 3
  %58 = and i32 %57, 511
  %59 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R25opsPfS_S_iE4Smem, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %61 = fmul contract float %35, %60
  %62 = fadd contract float %61, %56
  %63 = add nuw nsw i32 %12, 4
  %64 = and i32 %63, 511
  %65 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13shared4R25opsPfS_S_iE4Smem, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %67 = fmul contract float %29, %66
  %68 = fadd contract float %67, %62
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float %68, float addrspace(1)* %69, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %21, %20
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
