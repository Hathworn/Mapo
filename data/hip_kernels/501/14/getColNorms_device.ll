; ModuleID = '../data/hip_kernels/501/14/main.cu'
source_filename = "../data/hip_kernels/501/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11getColNormsiiPfiS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %101

16:                                               ; preds = %5
  %17 = mul nsw i32 %14, %3
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %21, label %43

21:                                               ; preds = %16
  %22 = and i32 %0, 7
  %23 = icmp ult i32 %0, 8
  br i1 %23, label %26, label %24

24:                                               ; preds = %21
  %25 = and i32 %0, -8
  br label %47

26:                                               ; preds = %47, %21
  %27 = phi float [ undef, %21 ], [ %97, %47 ]
  %28 = phi i32 [ 0, %21 ], [ %98, %47 ]
  %29 = phi float [ 0.000000e+00, %21 ], [ %97, %47 ]
  %30 = icmp eq i32 %22, 0
  br i1 %30, label %43, label %31

31:                                               ; preds = %26, %31
  %32 = phi i32 [ %40, %31 ], [ %28, %26 ]
  %33 = phi float [ %39, %31 ], [ %29, %26 ]
  %34 = phi i32 [ %41, %31 ], [ 0, %26 ]
  %35 = zext i32 %32 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %19, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = fmul contract float %37, %37
  %39 = fadd contract float %33, %38
  %40 = add nuw nsw i32 %32, 1
  %41 = add i32 %34, 1
  %42 = icmp eq i32 %41, %22
  br i1 %42, label %43, label %31, !llvm.loop !11

43:                                               ; preds = %26, %31, %16
  %44 = phi float [ 0.000000e+00, %16 ], [ %27, %26 ], [ %39, %31 ]
  %45 = sext i32 %14 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  store float %44, float addrspace(1)* %46, align 4, !tbaa !7
  br label %101

47:                                               ; preds = %47, %24
  %48 = phi i32 [ 0, %24 ], [ %98, %47 ]
  %49 = phi float [ 0.000000e+00, %24 ], [ %97, %47 ]
  %50 = phi i32 [ 0, %24 ], [ %99, %47 ]
  %51 = zext i32 %48 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %19, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fmul contract float %53, %53
  %55 = fadd contract float %49, %54
  %56 = or i32 %48, 1
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %19, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fmul contract float %59, %59
  %61 = fadd contract float %55, %60
  %62 = or i32 %48, 2
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %19, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fmul contract float %65, %65
  %67 = fadd contract float %61, %66
  %68 = or i32 %48, 3
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %19, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = fmul contract float %71, %71
  %73 = fadd contract float %67, %72
  %74 = or i32 %48, 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %19, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = fmul contract float %77, %77
  %79 = fadd contract float %73, %78
  %80 = or i32 %48, 5
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %19, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %79, %84
  %86 = or i32 %48, 6
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %19, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = fmul contract float %89, %89
  %91 = fadd contract float %85, %90
  %92 = or i32 %48, 7
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %19, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  %96 = fmul contract float %95, %95
  %97 = fadd contract float %91, %96
  %98 = add nuw nsw i32 %48, 8
  %99 = add i32 %50, 8
  %100 = icmp eq i32 %99, %25
  br i1 %100, label %26, label %47, !llvm.loop !13

101:                                              ; preds = %5, %43
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
