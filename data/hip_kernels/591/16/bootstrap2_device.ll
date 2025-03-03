; ModuleID = '../data/hip_kernels/591/16/main.cu'
source_filename = "../data/hip_kernels/591/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bootstrap2iiiPfPdPj(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = sext i32 %0 to i64
  %8 = sdiv i64 4294967295, %7
  %9 = trunc i64 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %0
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul i32 %20, %0
  %22 = icmp sgt i32 %0, 0
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  br i1 %22, label %24, label %56

24:                                               ; preds = %6
  %25 = and i32 %0, 3
  %26 = icmp ult i32 %0, 4
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %0, -4
  br label %70

29:                                               ; preds = %70, %24
  %30 = phi float [ undef, %24 ], [ %124, %70 ]
  %31 = phi float [ 0.000000e+00, %24 ], [ %124, %70 ]
  %32 = phi i32 [ 0, %24 ], [ %125, %70 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %53, label %34

34:                                               ; preds = %29, %34
  %35 = phi float [ %49, %34 ], [ %31, %29 ]
  %36 = phi i32 [ %50, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %51, %34 ], [ 0, %29 ]
  %38 = add nsw i32 %36, %11
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = udiv i32 %41, %9
  %43 = add i32 %42, %23
  %44 = urem i32 %43, %0
  %45 = add i32 %44, %21
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %3, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !11, !amdgpu.noclobber !5
  %49 = fadd contract float %35, %48
  %50 = add nuw nsw i32 %36, 1
  %51 = add i32 %37, 1
  %52 = icmp eq i32 %51, %25
  br i1 %52, label %53, label %34, !llvm.loop !13

53:                                               ; preds = %34, %29
  %54 = phi float [ %30, %29 ], [ %49, %34 ]
  %55 = fpext float %54 to double
  br label %56

56:                                               ; preds = %6, %53
  %57 = phi double [ %55, %53 ], [ 0.000000e+00, %6 ]
  %58 = mul i32 %20, %2
  %59 = sitofp i32 %1 to double
  %60 = fdiv contract double %57, %59
  %61 = add i32 %58, %23
  %62 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %63 = bitcast i8 addrspace(4)* %62 to i16 addrspace(4)*
  %64 = load i16, i16 addrspace(4)* %63, align 4, !range !4, !invariant.load !5
  %65 = zext i16 %64 to i32
  %66 = mul i32 %10, %65
  %67 = add i32 %61, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %4, i64 %68
  store double %60, double addrspace(1)* %69, align 8, !tbaa !15
  ret void

70:                                               ; preds = %70, %27
  %71 = phi float [ 0.000000e+00, %27 ], [ %124, %70 ]
  %72 = phi i32 [ 0, %27 ], [ %125, %70 ]
  %73 = phi i32 [ 0, %27 ], [ %126, %70 ]
  %74 = add nsw i32 %72, %11
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = udiv i32 %77, %9
  %79 = add i32 %78, %23
  %80 = urem i32 %79, %0
  %81 = add i32 %80, %21
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %3, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !11, !amdgpu.noclobber !5
  %85 = fadd contract float %71, %84
  %86 = or i32 %72, 1
  %87 = add nsw i32 %86, %11
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = udiv i32 %90, %9
  %92 = add i32 %91, %23
  %93 = urem i32 %92, %0
  %94 = add i32 %93, %21
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %3, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !5
  %98 = fadd contract float %85, %97
  %99 = or i32 %72, 2
  %100 = add nsw i32 %99, %11
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = udiv i32 %103, %9
  %105 = add i32 %104, %23
  %106 = urem i32 %105, %0
  %107 = add i32 %106, %21
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !11, !amdgpu.noclobber !5
  %111 = fadd contract float %98, %110
  %112 = or i32 %72, 3
  %113 = add nsw i32 %112, %11
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = udiv i32 %116, %9
  %118 = add i32 %117, %23
  %119 = urem i32 %118, %0
  %120 = add i32 %119, %21
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %3, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11, !amdgpu.noclobber !5
  %124 = fadd contract float %111, %123
  %125 = add nuw nsw i32 %72, 4
  %126 = add i32 %73, 4
  %127 = icmp eq i32 %126, %28
  br i1 %127, label %29, label %70, !llvm.loop !17
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"double", !9, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
