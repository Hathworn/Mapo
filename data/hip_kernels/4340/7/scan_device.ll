; ModuleID = '../data/hip_kernels/4340/7/main.cu'
source_filename = "../data/hip_kernels/4340/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4scanPfS_iE8sh_input = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4scanPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = add nuw nsw i32 %4, %9
  %12 = shl i32 %10, 1
  %13 = mul i32 %12, %9
  %14 = add i32 %13, %4
  %15 = add i32 %11, %13
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %25

17:                                               ; preds = %3
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %4
  store float %20, float addrspace(3)* %21, align 4, !tbaa !7
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %34

25:                                               ; preds = %3
  %26 = icmp slt i32 %14, %2
  br i1 %26, label %27, label %32

27:                                               ; preds = %25
  %28 = sext i32 %14 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %4
  store float %30, float addrspace(3)* %31, align 4, !tbaa !7
  br label %34

32:                                               ; preds = %25
  %33 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %4
  store float 0.000000e+00, float addrspace(3)* %33, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %27, %32, %17
  %35 = phi float [ 0.000000e+00, %27 ], [ 0.000000e+00, %32 ], [ %24, %17 ]
  %36 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %11
  store float %35, float addrspace(3)* %36, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = shl nuw nsw i32 %9, 1
  %38 = shl nuw nsw i32 %4, 1
  %39 = add nuw nsw i32 %38, 2
  br label %45

40:                                               ; preds = %57
  %41 = icmp ult i16 %8, 2
  br i1 %41, label %75, label %42

42:                                               ; preds = %40
  %43 = shl nuw nsw i32 %4, 1
  %44 = add nuw nsw i32 %43, 2
  br label %60

45:                                               ; preds = %34, %57
  %46 = phi i32 [ 1, %34 ], [ %58, %57 ]
  %47 = mul i32 %39, %46
  %48 = add i32 %47, -1
  %49 = icmp slt i32 %48, %37
  br i1 %49, label %50, label %57

50:                                               ; preds = %45
  %51 = sub i32 %48, %46
  %52 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %54 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %48
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %56 = fadd contract float %53, %55
  store float %56, float addrspace(3)* %54, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %50, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = shl i32 %46, 1
  %59 = icmp ugt i32 %58, %37
  br i1 %59, label %40, label %45, !llvm.loop !11

60:                                               ; preds = %42, %73
  %61 = phi i32 [ %9, %42 ], [ %62, %73 ]
  %62 = lshr i32 %61, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = mul nuw nsw i32 %44, %62
  %64 = add nsw i32 %63, -1
  %65 = add nsw i32 %64, %62
  %66 = icmp ult i32 %65, %37
  br i1 %66, label %67, label %73

67:                                               ; preds = %60
  %68 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %64
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %70 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %65
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = fadd contract float %69, %71
  store float %72, float addrspace(3)* %70, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %60, %67
  %74 = icmp ult i32 %61, 4
  br i1 %74, label %75, label %60, !llvm.loop !13

75:                                               ; preds = %73, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %4
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %78 = sext i32 %14 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  store float %77, float addrspace(1)* %79, align 4, !tbaa !7
  %80 = add nsw i32 %14, %9
  %81 = icmp slt i32 %80, %2
  br i1 %81, label %82, label %87

82:                                               ; preds = %75
  %83 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_iE8sh_input, i32 0, i32 %11
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %85 = sext i32 %80 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %84, float addrspace(1)* %86, align 4, !tbaa !7
  br label %87

87:                                               ; preds = %82, %75
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
!13 = distinct !{!13, !12}
