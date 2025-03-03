; ModuleID = '../data/hip_kernels/538/7/main.cu'
source_filename = "../data/hip_kernels/538/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15forcered_simplePfS_E11forcered_sh = internal unnamed_addr addrspace(3) global [1029 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15forcered_simplePfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = add i32 %10, %3
  %12 = freeze i32 %11
  %13 = icmp slt i32 %12, 1029
  br i1 %13, label %14, label %16

14:                                               ; preds = %2
  %15 = getelementptr inbounds [1029 x float], [1029 x float] addrspace(3)* @_ZZ15forcered_simplePfS_E11forcered_sh, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %15, align 4, !tbaa !7
  br label %16

16:                                               ; preds = %14, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %17, label %83

17:                                               ; preds = %16
  %18 = srem i32 %12, 343
  %19 = sub nsw i32 %12, %18
  %20 = getelementptr inbounds [1029 x float], [1029 x float] addrspace(3)* @_ZZ15forcered_simplePfS_E11forcered_sh, i32 0, i32 %12
  %21 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  br label %22

22:                                               ; preds = %22, %17
  %23 = phi i32 [ 0, %17 ], [ %80, %22 ]
  %24 = phi float [ %21, %17 ], [ %79, %22 ]
  %25 = add i32 %23, %19
  %26 = mul i32 %25, 343
  %27 = add i32 %26, %18
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = fadd contract float %30, %24
  %32 = add nuw nsw i32 %23, 1
  %33 = add i32 %32, %19
  %34 = mul i32 %33, 343
  %35 = add i32 %34, %18
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = fadd contract float %38, %31
  %40 = add nuw nsw i32 %23, 2
  %41 = add i32 %40, %19
  %42 = mul i32 %41, 343
  %43 = add i32 %42, %18
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = fadd contract float %46, %39
  %48 = add nuw nsw i32 %23, 3
  %49 = add i32 %48, %19
  %50 = mul i32 %49, 343
  %51 = add i32 %50, %18
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = fadd contract float %54, %47
  %56 = add nuw nsw i32 %23, 4
  %57 = add i32 %56, %19
  %58 = mul i32 %57, 343
  %59 = add i32 %58, %18
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = fadd contract float %62, %55
  %64 = add nuw nsw i32 %23, 5
  %65 = add i32 %64, %19
  %66 = mul i32 %65, 343
  %67 = add i32 %66, %18
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = fadd contract float %70, %63
  %72 = add nuw nsw i32 %23, 6
  %73 = add i32 %72, %19
  %74 = mul i32 %73, 343
  %75 = add i32 %74, %18
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !6
  %79 = fadd contract float %78, %71
  %80 = add nuw nsw i32 %23, 7
  %81 = icmp eq i32 %80, 343
  br i1 %81, label %82, label %22, !llvm.loop !11

82:                                               ; preds = %22
  store float %79, float addrspace(3)* %20, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %82, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %84, label %89

84:                                               ; preds = %83
  %85 = sext i32 %12 to i64
  %86 = getelementptr inbounds [1029 x float], [1029 x float] addrspace(3)* @_ZZ15forcered_simplePfS_E11forcered_sh, i32 0, i32 %12
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %87, float addrspace(1)* %88, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %84, %83
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
