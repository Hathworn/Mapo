; ModuleID = '../data/hip_kernels/9103/3/main.cu'
source_filename = "../data/hip_kernels/9103/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL12sum_channelsPfPKfjj = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL12sum_channelsPfPKfjj(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 comdat {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %13, %3
  br i1 %14, label %15, label %106

15:                                               ; preds = %4
  %16 = icmp eq i32 %2, 0
  br i1 %16, label %40, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 7
  %19 = icmp ult i32 %2, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %2, -8
  br label %44

22:                                               ; preds = %44, %17
  %23 = phi float [ undef, %17 ], [ %102, %44 ]
  %24 = phi i32 [ 0, %17 ], [ %103, %44 ]
  %25 = phi float [ 0.000000e+00, %17 ], [ %102, %44 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %40, label %27

27:                                               ; preds = %22, %27
  %28 = phi i32 [ %37, %27 ], [ %24, %22 ]
  %29 = phi float [ %36, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %38, %27 ], [ 0, %22 ]
  %31 = mul i32 %28, %3
  %32 = add i32 %31, %13
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fadd contract float %29, %35
  %37 = add nuw i32 %28, 1
  %38 = add i32 %30, 1
  %39 = icmp eq i32 %38, %18
  br i1 %39, label %40, label %27, !llvm.loop !11

40:                                               ; preds = %22, %27, %15
  %41 = phi float [ 0.000000e+00, %15 ], [ %23, %22 ], [ %36, %27 ]
  %42 = sext i32 %13 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  store float %41, float addrspace(1)* %43, align 4, !tbaa !7
  br label %106

44:                                               ; preds = %44, %20
  %45 = phi i32 [ 0, %20 ], [ %103, %44 ]
  %46 = phi float [ 0.000000e+00, %20 ], [ %102, %44 ]
  %47 = phi i32 [ 0, %20 ], [ %104, %44 ]
  %48 = mul i32 %45, %3
  %49 = add i32 %48, %13
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fadd contract float %46, %52
  %54 = or i32 %45, 1
  %55 = mul i32 %54, %3
  %56 = add i32 %55, %13
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fadd contract float %53, %59
  %61 = or i32 %45, 2
  %62 = mul i32 %61, %3
  %63 = add i32 %62, %13
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fadd contract float %60, %66
  %68 = or i32 %45, 3
  %69 = mul i32 %68, %3
  %70 = add i32 %69, %13
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = fadd contract float %67, %73
  %75 = or i32 %45, 4
  %76 = mul i32 %75, %3
  %77 = add i32 %76, %13
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = fadd contract float %74, %80
  %82 = or i32 %45, 5
  %83 = mul i32 %82, %3
  %84 = add i32 %83, %13
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fadd contract float %81, %87
  %89 = or i32 %45, 6
  %90 = mul i32 %89, %3
  %91 = add i32 %90, %13
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = fadd contract float %88, %94
  %96 = or i32 %45, 7
  %97 = mul i32 %96, %3
  %98 = add i32 %97, %13
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fadd contract float %95, %101
  %103 = add nuw i32 %45, 8
  %104 = add i32 %47, 8
  %105 = icmp eq i32 %104, %21
  br i1 %105, label %22, label %44, !llvm.loop !13

106:                                              ; preds = %4, %40
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
