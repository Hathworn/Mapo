; ModuleID = '../data/hip_kernels/2571/0/main.cu'
source_filename = "../data/hip_kernels/2571/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20polynomial_expansionPfiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %112

15:                                               ; preds = %4
  %16 = icmp slt i32 %1, 0
  %17 = sext i32 %13 to i64
  br i1 %16, label %46, label %18

18:                                               ; preds = %15
  %19 = getelementptr inbounds float, float addrspace(1)* %3, i64 %17
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = add i32 %1, 1
  %22 = and i32 %21, 7
  %23 = icmp ult i32 %1, 7
  br i1 %23, label %26, label %24

24:                                               ; preds = %18
  %25 = and i32 %21, -8
  br label %49

26:                                               ; preds = %49, %18
  %27 = phi float [ undef, %18 ], [ %107, %49 ]
  %28 = phi i32 [ 0, %18 ], [ %109, %49 ]
  %29 = phi float [ 1.000000e+00, %18 ], [ %108, %49 ]
  %30 = phi float [ 0.000000e+00, %18 ], [ %107, %49 ]
  %31 = icmp eq i32 %22, 0
  br i1 %31, label %46, label %32

32:                                               ; preds = %26, %32
  %33 = phi i32 [ %43, %32 ], [ %28, %26 ]
  %34 = phi float [ %42, %32 ], [ %29, %26 ]
  %35 = phi float [ %41, %32 ], [ %30, %26 ]
  %36 = phi i32 [ %44, %32 ], [ 0, %26 ]
  %37 = zext i32 %33 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract float %34, %39
  %41 = fadd contract float %35, %40
  %42 = fmul contract float %34, %20
  %43 = add nuw i32 %33, 1
  %44 = add i32 %36, 1
  %45 = icmp eq i32 %44, %22
  br i1 %45, label %46, label %32, !llvm.loop !11

46:                                               ; preds = %26, %32, %15
  %47 = phi float [ 0.000000e+00, %15 ], [ %27, %26 ], [ %41, %32 ]
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %17
  store float %47, float addrspace(1)* %48, align 4, !tbaa !7
  br label %112

49:                                               ; preds = %49, %24
  %50 = phi i32 [ 0, %24 ], [ %109, %49 ]
  %51 = phi float [ 1.000000e+00, %24 ], [ %108, %49 ]
  %52 = phi float [ 0.000000e+00, %24 ], [ %107, %49 ]
  %53 = phi i32 [ 0, %24 ], [ %110, %49 ]
  %54 = zext i32 %50 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fmul contract float %51, %56
  %58 = fadd contract float %52, %57
  %59 = fmul contract float %51, %20
  %60 = or i32 %50, 1
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fmul contract float %59, %63
  %65 = fadd contract float %58, %64
  %66 = fmul contract float %59, %20
  %67 = or i32 %50, 2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fmul contract float %66, %70
  %72 = fadd contract float %65, %71
  %73 = fmul contract float %66, %20
  %74 = or i32 %50, 3
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %73, %77
  %79 = fadd contract float %72, %78
  %80 = fmul contract float %73, %20
  %81 = or i32 %50, 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fmul contract float %80, %84
  %86 = fadd contract float %79, %85
  %87 = fmul contract float %80, %20
  %88 = or i32 %50, 5
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fmul contract float %87, %91
  %93 = fadd contract float %86, %92
  %94 = fmul contract float %87, %20
  %95 = or i32 %50, 6
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fmul contract float %94, %98
  %100 = fadd contract float %93, %99
  %101 = fmul contract float %94, %20
  %102 = or i32 %50, 7
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract float %101, %105
  %107 = fadd contract float %100, %106
  %108 = fmul contract float %101, %20
  %109 = add nuw i32 %50, 8
  %110 = add i32 %53, 8
  %111 = icmp eq i32 %110, %25
  br i1 %111, label %26, label %49, !llvm.loop !13

112:                                              ; preds = %46, %4
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
