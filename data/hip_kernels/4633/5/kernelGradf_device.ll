; ModuleID = '../data/hip_kernels/4633/5/main.cu'
source_filename = "../data/hip_kernels/4633/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11kernelGradfPKfPfS1_S1_m(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %15, %4
  br i1 %16, label %17, label %119

17:                                               ; preds = %5
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  store float 0.000000e+00, float addrspace(1)* %18, align 4, !tbaa !7
  %19 = mul i64 %15, %4
  %20 = and i64 %4, 7
  %21 = icmp ult i64 %4, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %17
  %23 = and i64 %4, -8
  br label %49

24:                                               ; preds = %49, %17
  %25 = phi float [ undef, %17 ], [ %115, %49 ]
  %26 = phi float [ 0.000000e+00, %17 ], [ %115, %49 ]
  %27 = phi i64 [ 0, %17 ], [ %116, %49 ]
  %28 = icmp eq i64 %20, 0
  br i1 %28, label %43, label %29

29:                                               ; preds = %24, %29
  %30 = phi float [ %39, %29 ], [ %26, %24 ]
  %31 = phi i64 [ %40, %29 ], [ %27, %24 ]
  %32 = phi i64 [ %41, %29 ], [ 0, %24 ]
  %33 = add i64 %31, %19
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = fmul contract float %35, %37
  %39 = fadd contract float %30, %38
  store float %39, float addrspace(1)* %18, align 4, !tbaa !7
  %40 = add nuw i64 %31, 1
  %41 = add i64 %32, 1
  %42 = icmp eq i64 %41, %20
  br i1 %42, label %43, label %29, !llvm.loop !11

43:                                               ; preds = %29, %24
  %44 = phi float [ %25, %24 ], [ %39, %29 ]
  %45 = fmul contract float %44, 2.000000e+00
  store float %45, float addrspace(1)* %18, align 4, !tbaa !7
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %15
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = fadd contract float %45, %47
  store float %48, float addrspace(1)* %18, align 4, !tbaa !7
  br label %119

49:                                               ; preds = %49, %22
  %50 = phi float [ 0.000000e+00, %22 ], [ %115, %49 ]
  %51 = phi i64 [ 0, %22 ], [ %116, %49 ]
  %52 = phi i64 [ 0, %22 ], [ %117, %49 ]
  %53 = add i64 %51, %19
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = fmul contract float %55, %57
  %59 = fadd contract float %50, %58
  store float %59, float addrspace(1)* %18, align 4, !tbaa !7
  %60 = or i64 %51, 1
  %61 = add i64 %60, %19
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fmul contract float %63, %65
  %67 = fadd contract float %59, %66
  store float %67, float addrspace(1)* %18, align 4, !tbaa !7
  %68 = or i64 %51, 2
  %69 = add i64 %68, %19
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = fmul contract float %71, %73
  %75 = fadd contract float %67, %74
  store float %75, float addrspace(1)* %18, align 4, !tbaa !7
  %76 = or i64 %51, 3
  %77 = add i64 %76, %19
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fmul contract float %79, %81
  %83 = fadd contract float %75, %82
  store float %83, float addrspace(1)* %18, align 4, !tbaa !7
  %84 = or i64 %51, 4
  %85 = add i64 %84, %19
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = fmul contract float %87, %89
  %91 = fadd contract float %83, %90
  store float %91, float addrspace(1)* %18, align 4, !tbaa !7
  %92 = or i64 %51, 5
  %93 = add i64 %92, %19
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = fmul contract float %95, %97
  %99 = fadd contract float %91, %98
  store float %99, float addrspace(1)* %18, align 4, !tbaa !7
  %100 = or i64 %51, 6
  %101 = add i64 %100, %19
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fmul contract float %103, %105
  %107 = fadd contract float %99, %106
  store float %107, float addrspace(1)* %18, align 4, !tbaa !7
  %108 = or i64 %51, 7
  %109 = add i64 %108, %19
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = fmul contract float %111, %113
  %115 = fadd contract float %107, %114
  store float %115, float addrspace(1)* %18, align 4, !tbaa !7
  %116 = add nuw i64 %51, 8
  %117 = add i64 %52, 8
  %118 = icmp eq i64 %117, %23
  br i1 %118, label %24, label %49, !llvm.loop !13

119:                                              ; preds = %5, %43
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
