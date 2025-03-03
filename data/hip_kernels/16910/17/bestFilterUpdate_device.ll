; ModuleID = '../data/hip_kernels/16910/17/main.cu'
source_filename = "../data/hip_kernels/16910/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16bestFilterUpdatePKdPKfS2_PfS3_PiPKiS6_S6_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readnone %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readnone %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %11 = fptosi double %10 to i32
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !4, !amdgpu.noclobber !8
  %14 = fptosi double %13 to i32
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !4, !amdgpu.noclobber !8
  %17 = fptrunc double %16 to float
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 1
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !9, !amdgpu.noclobber !8
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = add i32 %19, %20
  %22 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !9, !amdgpu.noclobber !8
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %131

24:                                               ; preds = %9
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !8
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !11
  %28 = fptosi double %26 to i32
  %29 = sext i32 %21 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !9, !amdgpu.noclobber !8
  %32 = sub nsw i32 %31, %28
  %33 = add nsw i32 %32, %27
  %34 = icmp sgt i32 %33, -1
  %35 = icmp slt i32 %33, %11
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %131

37:                                               ; preds = %24
  %38 = icmp sgt i32 %14, 0
  br i1 %38, label %39, label %125

39:                                               ; preds = %37
  %40 = fadd contract float %17, 1.000000e+00
  %41 = and i32 %14, 1
  %42 = icmp eq i32 %14, 1
  br i1 %42, label %96, label %43

43:                                               ; preds = %39
  %44 = and i32 %14, -2
  br label %45

45:                                               ; preds = %45, %43
  %46 = phi i32 [ 0, %43 ], [ %93, %45 ]
  %47 = phi i32 [ 0, %43 ], [ %92, %45 ]
  %48 = phi float [ 0.000000e+00, %43 ], [ %91, %45 ]
  %49 = phi i32 [ 0, %43 ], [ %94, %45 ]
  %50 = mul nsw i32 %46, %11
  %51 = add nsw i32 %50, %33
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !12, !amdgpu.noclobber !8
  %55 = tail call float @llvm.maxnum.f32(float %54, float 0.000000e+00)
  %56 = zext i32 %46 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !12, !amdgpu.noclobber !8
  %59 = fmul contract float %58, %17
  %60 = fadd contract float %55, %59
  %61 = fmul contract float %60, %60
  %62 = fdiv contract float %61, %40
  %63 = fmul contract float %58, %59
  %64 = fsub contract float %62, %63
  %65 = fpext float %64 to double
  %66 = fpext float %48 to double
  %67 = fadd contract double %66, 0x3EB0C6F7A0B5ED8D
  %68 = fcmp contract olt double %67, %65
  %69 = select i1 %68, float %64, float %48
  %70 = select i1 %68, i32 %46, i32 %47
  %71 = or i32 %46, 1
  %72 = mul nsw i32 %71, %11
  %73 = add nsw i32 %72, %33
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !12, !amdgpu.noclobber !8
  %77 = tail call float @llvm.maxnum.f32(float %76, float 0.000000e+00)
  %78 = zext i32 %71 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !12, !amdgpu.noclobber !8
  %81 = fmul contract float %80, %17
  %82 = fadd contract float %77, %81
  %83 = fmul contract float %82, %82
  %84 = fdiv contract float %83, %40
  %85 = fmul contract float %80, %81
  %86 = fsub contract float %84, %85
  %87 = fpext float %86 to double
  %88 = fpext float %69 to double
  %89 = fadd contract double %88, 0x3EB0C6F7A0B5ED8D
  %90 = fcmp contract olt double %89, %87
  %91 = select i1 %90, float %86, float %69
  %92 = select i1 %90, i32 %71, i32 %70
  %93 = add nuw nsw i32 %46, 2
  %94 = add i32 %49, 2
  %95 = icmp eq i32 %94, %44
  br i1 %95, label %96, label %45, !llvm.loop !14

96:                                               ; preds = %45, %39
  %97 = phi float [ undef, %39 ], [ %91, %45 ]
  %98 = phi i32 [ undef, %39 ], [ %92, %45 ]
  %99 = phi i32 [ 0, %39 ], [ %93, %45 ]
  %100 = phi i32 [ 0, %39 ], [ %92, %45 ]
  %101 = phi float [ 0.000000e+00, %39 ], [ %91, %45 ]
  %102 = icmp eq i32 %41, 0
  br i1 %102, label %125, label %103

103:                                              ; preds = %96
  %104 = mul nsw i32 %99, %11
  %105 = add nsw i32 %104, %33
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !12, !amdgpu.noclobber !8
  %109 = tail call float @llvm.maxnum.f32(float %108, float 0.000000e+00)
  %110 = zext i32 %99 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !12, !amdgpu.noclobber !8
  %113 = fmul contract float %112, %17
  %114 = fadd contract float %109, %113
  %115 = fmul contract float %114, %114
  %116 = fdiv contract float %115, %40
  %117 = fmul contract float %112, %113
  %118 = fsub contract float %116, %117
  %119 = fpext float %118 to double
  %120 = fpext float %101 to double
  %121 = fadd contract double %120, 0x3EB0C6F7A0B5ED8D
  %122 = fcmp contract olt double %121, %119
  %123 = select i1 %122, float %118, float %101
  %124 = select i1 %122, i32 %99, i32 %100
  br label %125

125:                                              ; preds = %103, %96, %37
  %126 = phi float [ 0.000000e+00, %37 ], [ %97, %96 ], [ %123, %103 ]
  %127 = phi i32 [ 0, %37 ], [ %98, %96 ], [ %124, %103 ]
  %128 = zext i32 %33 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %3, i64 %128
  store float %126, float addrspace(1)* %129, align 4, !tbaa !12
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %128
  store i32 %127, i32 addrspace(1)* %130, align 4, !tbaa !9
  br label %131

131:                                              ; preds = %24, %125, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = !{i32 0, i32 1024}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !6, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
