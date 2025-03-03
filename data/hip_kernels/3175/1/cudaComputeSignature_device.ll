; ModuleID = '../data/hip_kernels/3175/1/main.cu'
source_filename = "../data/hip_kernels/3175/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20cudaComputeSignaturePdS_PiPbPl(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3, i64 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = zext i32 %14 to i64
  %16 = load i64, i64 addrspace(1)* %4, align 8, !tbaa !7, !amdgpu.noclobber !6
  %17 = icmp sgt i64 %16, %15
  br i1 %17, label %18, label %133

18:                                               ; preds = %5
  %19 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !11, !amdgpu.noclobber !6
  %20 = sext i32 %19 to i64
  %21 = mul nsw i64 %20, %15
  %22 = icmp sgt i32 %19, 0
  br i1 %22, label %23, label %51

23:                                               ; preds = %18
  %24 = and i32 %19, 7
  %25 = icmp ult i32 %19, 8
  br i1 %25, label %28, label %26

26:                                               ; preds = %23
  %27 = and i32 %19, -8
  br label %55

28:                                               ; preds = %55, %23
  %29 = phi double [ undef, %23 ], [ %129, %55 ]
  %30 = phi i32 [ 0, %23 ], [ %130, %55 ]
  %31 = phi double [ 0.000000e+00, %23 ], [ %129, %55 ]
  %32 = icmp eq i32 %24, 0
  br i1 %32, label %48, label %33

33:                                               ; preds = %28, %33
  %34 = phi i32 [ %45, %33 ], [ %30, %28 ]
  %35 = phi double [ %44, %33 ], [ %31, %28 ]
  %36 = phi i32 [ %46, %33 ], [ 0, %28 ]
  %37 = zext i32 %34 to i64
  %38 = add nsw i64 %21, %37
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !13, !amdgpu.noclobber !6
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !13, !amdgpu.noclobber !6
  %43 = fmul contract double %40, %42
  %44 = fadd contract double %35, %43
  %45 = add nuw nsw i32 %34, 1
  %46 = add i32 %36, 1
  %47 = icmp eq i32 %46, %24
  br i1 %47, label %48, label %33, !llvm.loop !15

48:                                               ; preds = %33, %28
  %49 = phi double [ %29, %28 ], [ %44, %33 ]
  %50 = fcmp contract oge double %49, 0.000000e+00
  br label %51

51:                                               ; preds = %48, %18
  %52 = phi i1 [ true, %18 ], [ %50, %48 ]
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %15
  %54 = zext i1 %52 to i8
  store i8 %54, i8 addrspace(1)* %53, align 1, !tbaa !17
  br label %133

55:                                               ; preds = %55, %26
  %56 = phi i32 [ 0, %26 ], [ %130, %55 ]
  %57 = phi double [ 0.000000e+00, %26 ], [ %129, %55 ]
  %58 = phi i32 [ 0, %26 ], [ %131, %55 ]
  %59 = zext i32 %56 to i64
  %60 = add nsw i64 %21, %59
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !13, !amdgpu.noclobber !6
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %59
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !13, !amdgpu.noclobber !6
  %65 = fmul contract double %62, %64
  %66 = fadd contract double %57, %65
  %67 = or i32 %56, 1
  %68 = zext i32 %67 to i64
  %69 = add nsw i64 %21, %68
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !13, !amdgpu.noclobber !6
  %72 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !13, !amdgpu.noclobber !6
  %74 = fmul contract double %71, %73
  %75 = fadd contract double %66, %74
  %76 = or i32 %56, 2
  %77 = zext i32 %76 to i64
  %78 = add nsw i64 %21, %77
  %79 = getelementptr inbounds double, double addrspace(1)* %0, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !13, !amdgpu.noclobber !6
  %81 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !13, !amdgpu.noclobber !6
  %83 = fmul contract double %80, %82
  %84 = fadd contract double %75, %83
  %85 = or i32 %56, 3
  %86 = zext i32 %85 to i64
  %87 = add nsw i64 %21, %86
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !13, !amdgpu.noclobber !6
  %90 = getelementptr inbounds double, double addrspace(1)* %1, i64 %86
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !13, !amdgpu.noclobber !6
  %92 = fmul contract double %89, %91
  %93 = fadd contract double %84, %92
  %94 = or i32 %56, 4
  %95 = zext i32 %94 to i64
  %96 = add nsw i64 %21, %95
  %97 = getelementptr inbounds double, double addrspace(1)* %0, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !13, !amdgpu.noclobber !6
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %95
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !13, !amdgpu.noclobber !6
  %101 = fmul contract double %98, %100
  %102 = fadd contract double %93, %101
  %103 = or i32 %56, 5
  %104 = zext i32 %103 to i64
  %105 = add nsw i64 %21, %104
  %106 = getelementptr inbounds double, double addrspace(1)* %0, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !13, !amdgpu.noclobber !6
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %104
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !13, !amdgpu.noclobber !6
  %110 = fmul contract double %107, %109
  %111 = fadd contract double %102, %110
  %112 = or i32 %56, 6
  %113 = zext i32 %112 to i64
  %114 = add nsw i64 %21, %113
  %115 = getelementptr inbounds double, double addrspace(1)* %0, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !13, !amdgpu.noclobber !6
  %117 = getelementptr inbounds double, double addrspace(1)* %1, i64 %113
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !13, !amdgpu.noclobber !6
  %119 = fmul contract double %116, %118
  %120 = fadd contract double %111, %119
  %121 = or i32 %56, 7
  %122 = zext i32 %121 to i64
  %123 = add nsw i64 %21, %122
  %124 = getelementptr inbounds double, double addrspace(1)* %0, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !13, !amdgpu.noclobber !6
  %126 = getelementptr inbounds double, double addrspace(1)* %1, i64 %122
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !13, !amdgpu.noclobber !6
  %128 = fmul contract double %125, %127
  %129 = fadd contract double %120, %128
  %130 = add nuw nsw i32 %56, 8
  %131 = add i32 %58, 8
  %132 = icmp eq i32 %131, %27
  br i1 %132, label %28, label %55, !llvm.loop !19

133:                                              ; preds = %51, %5
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"double", !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18, !18, i64 0}
!18 = !{!"bool", !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
