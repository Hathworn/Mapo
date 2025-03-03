; ModuleID = '../data/hip_kernels/14017/0/main.cu'
source_filename = "../data/hip_kernels/14017/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10nms_kernelifPKfPyE11block_boxes = internal unnamed_addr addrspace(3) global [320 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10nms_kernelifPKfPy(i32 %0, float %1, float addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl nsw i32 %5, 6
  %8 = sub nsw i32 %0, %7
  %9 = tail call i32 @llvm.smin.i32(i32 %8, i32 64)
  %10 = shl nsw i32 %6, 6
  %11 = sub nsw i32 %0, %10
  %12 = tail call i32 @llvm.smin.i32(i32 %11, i32 64)
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = icmp ult i32 %13, %12
  br i1 %14, label %15, label %47

15:                                               ; preds = %4
  %16 = add i32 %10, %13
  %17 = mul i32 %16, 5
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = mul nuw nsw i32 %13, 5
  %22 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelifPKfPyE11block_boxes, i32 0, i32 %21
  store float %20, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = add i32 %17, 1
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = add nuw nsw i32 %21, 1
  %28 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelifPKfPyE11block_boxes, i32 0, i32 %27
  store float %26, float addrspace(3)* %28, align 4, !tbaa !5
  %29 = add i32 %17, 2
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = add nuw nsw i32 %21, 2
  %34 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelifPKfPyE11block_boxes, i32 0, i32 %33
  store float %32, float addrspace(3)* %34, align 4, !tbaa !5
  %35 = add i32 %17, 3
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = add nuw nsw i32 %21, 3
  %40 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelifPKfPyE11block_boxes, i32 0, i32 %39
  store float %38, float addrspace(3)* %40, align 4, !tbaa !5
  %41 = add i32 %17, 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = add nuw nsw i32 %21, 4
  %46 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelifPKfPyE11block_boxes, i32 0, i32 %45
  store float %44, float addrspace(3)* %46, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %13, %9
  br i1 %48, label %49, label %120

49:                                               ; preds = %47
  %50 = add i32 %7, %13
  %51 = mul nsw i32 %50, 5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = icmp eq i32 %5, %6
  %55 = add nuw nsw i32 %13, 1
  %56 = select i1 %54, i32 %55, i32 0
  %57 = icmp slt i32 %56, %12
  br i1 %57, label %58, label %109

58:                                               ; preds = %49
  %59 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = getelementptr inbounds float, float addrspace(1)* %53, i64 2
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = getelementptr inbounds float, float addrspace(1)* %53, i64 1
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = getelementptr inbounds float, float addrspace(1)* %53, i64 3
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = fsub contract float %61, %59
  %67 = fadd contract float %66, 1.000000e+00
  %68 = fsub contract float %65, %63
  %69 = fadd contract float %68, 1.000000e+00
  %70 = fmul contract float %67, %69
  br label %71

71:                                               ; preds = %58, %71
  %72 = phi i32 [ %56, %58 ], [ %107, %71 ]
  %73 = phi i64 [ 0, %58 ], [ %106, %71 ]
  %74 = mul nuw nsw i32 %72, 5
  %75 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelifPKfPyE11block_boxes, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %77 = tail call float @llvm.maxnum.f32(float %59, float %76)
  %78 = getelementptr inbounds float, float addrspace(3)* %75, i32 2
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = tail call float @llvm.minnum.f32(float %61, float %79)
  %81 = getelementptr inbounds float, float addrspace(3)* %75, i32 1
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %83 = tail call float @llvm.maxnum.f32(float %63, float %82)
  %84 = getelementptr inbounds float, float addrspace(3)* %75, i32 3
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %86 = tail call float @llvm.minnum.f32(float %65, float %85)
  %87 = fsub contract float %80, %77
  %88 = fadd contract float %87, 1.000000e+00
  %89 = tail call float @llvm.maxnum.f32(float %88, float 0.000000e+00)
  %90 = fsub contract float %86, %83
  %91 = fadd contract float %90, 1.000000e+00
  %92 = tail call float @llvm.maxnum.f32(float %91, float 0.000000e+00)
  %93 = fmul contract float %89, %92
  %94 = fsub contract float %79, %76
  %95 = fadd contract float %94, 1.000000e+00
  %96 = fsub contract float %85, %82
  %97 = fadd contract float %96, 1.000000e+00
  %98 = fmul contract float %95, %97
  %99 = fadd contract float %70, %98
  %100 = fsub contract float %99, %93
  %101 = fdiv contract float %93, %100
  %102 = fcmp contract ogt float %101, %1
  %103 = zext i32 %72 to i64
  %104 = shl nuw i64 1, %103
  %105 = select i1 %102, i64 %104, i64 0
  %106 = or i64 %105, %73
  %107 = add nuw nsw i32 %72, 1
  %108 = icmp slt i32 %107, %12
  br i1 %108, label %71, label %109, !llvm.loop !10

109:                                              ; preds = %71, %49
  %110 = phi i64 [ 0, %49 ], [ %106, %71 ]
  %111 = sdiv i32 %0, 64
  %112 = and i32 %0, -2147483585
  %113 = icmp sgt i32 %112, 0
  %114 = zext i1 %113 to i32
  %115 = add nsw i32 %111, %114
  %116 = mul nsw i32 %115, %50
  %117 = add nsw i32 %116, %6
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %118
  store i64 %110, i64 addrspace(1)* %119, align 8, !tbaa !12
  br label %120

120:                                              ; preds = %109, %47
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long long", !7, i64 0}
