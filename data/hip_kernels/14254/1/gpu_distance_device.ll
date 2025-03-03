; ModuleID = '../data/hip_kernels/14254/1/main.cu'
source_filename = "../data/hip_kernels/14254/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12gpu_distancePiPfS_ii(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %153

16:                                               ; preds = %5
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %47

18:                                               ; preds = %16
  %19 = mul nsw i32 %14, %4
  %20 = and i32 %4, 7
  %21 = icmp ult i32 %4, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = and i32 %4, -8
  br label %51

24:                                               ; preds = %51, %18
  %25 = phi float [ undef, %18 ], [ %149, %51 ]
  %26 = phi i32 [ 0, %18 ], [ %150, %51 ]
  %27 = phi float [ 0.000000e+00, %18 ], [ %149, %51 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %47, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %44, %29 ], [ %26, %24 ]
  %31 = phi float [ %43, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %45, %29 ], [ 0, %24 ]
  %33 = add nsw i32 %30, %19
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i32 %30 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = sub nsw i32 %36, %39
  %41 = tail call i32 @llvm.abs.i32(i32 %40, i1 true)
  %42 = sitofp i32 %41 to float
  %43 = fadd contract float %31, %42
  %44 = add nuw nsw i32 %30, 1
  %45 = add i32 %32, 1
  %46 = icmp eq i32 %45, %20
  br i1 %46, label %47, label %29, !llvm.loop !11

47:                                               ; preds = %24, %29, %16
  %48 = phi float [ 0.000000e+00, %16 ], [ %25, %24 ], [ %43, %29 ]
  %49 = sext i32 %14 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !13
  br label %153

51:                                               ; preds = %51, %22
  %52 = phi i32 [ 0, %22 ], [ %150, %51 ]
  %53 = phi float [ 0.000000e+00, %22 ], [ %149, %51 ]
  %54 = phi i32 [ 0, %22 ], [ %151, %51 ]
  %55 = add nsw i32 %52, %19
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = zext i32 %52 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = sub nsw i32 %58, %61
  %63 = tail call i32 @llvm.abs.i32(i32 %62, i1 true)
  %64 = sitofp i32 %63 to float
  %65 = fadd contract float %53, %64
  %66 = or i32 %52, 1
  %67 = add nsw i32 %66, %19
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = zext i32 %66 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = sub nsw i32 %70, %73
  %75 = tail call i32 @llvm.abs.i32(i32 %74, i1 true)
  %76 = sitofp i32 %75 to float
  %77 = fadd contract float %65, %76
  %78 = or i32 %52, 2
  %79 = add nsw i32 %78, %19
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = sub nsw i32 %82, %85
  %87 = tail call i32 @llvm.abs.i32(i32 %86, i1 true)
  %88 = sitofp i32 %87 to float
  %89 = fadd contract float %77, %88
  %90 = or i32 %52, 3
  %91 = add nsw i32 %90, %19
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = zext i32 %90 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = sub nsw i32 %94, %97
  %99 = tail call i32 @llvm.abs.i32(i32 %98, i1 true)
  %100 = sitofp i32 %99 to float
  %101 = fadd contract float %89, %100
  %102 = or i32 %52, 4
  %103 = add nsw i32 %102, %19
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = zext i32 %102 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = sub nsw i32 %106, %109
  %111 = tail call i32 @llvm.abs.i32(i32 %110, i1 true)
  %112 = sitofp i32 %111 to float
  %113 = fadd contract float %101, %112
  %114 = or i32 %52, 5
  %115 = add nsw i32 %114, %19
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = zext i32 %114 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = sub nsw i32 %118, %121
  %123 = tail call i32 @llvm.abs.i32(i32 %122, i1 true)
  %124 = sitofp i32 %123 to float
  %125 = fadd contract float %113, %124
  %126 = or i32 %52, 6
  %127 = add nsw i32 %126, %19
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = zext i32 %126 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = sub nsw i32 %130, %133
  %135 = tail call i32 @llvm.abs.i32(i32 %134, i1 true)
  %136 = sitofp i32 %135 to float
  %137 = fadd contract float %125, %136
  %138 = or i32 %52, 7
  %139 = add nsw i32 %138, %19
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = zext i32 %138 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = sub nsw i32 %142, %145
  %147 = tail call i32 @llvm.abs.i32(i32 %146, i1 true)
  %148 = sitofp i32 %147 to float
  %149 = fadd contract float %137, %148
  %150 = add nuw nsw i32 %52, 8
  %151 = add i32 %54, 8
  %152 = icmp eq i32 %151, %23
  br i1 %152, label %24, label %51, !llvm.loop !15

153:                                              ; preds = %5, %47
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
