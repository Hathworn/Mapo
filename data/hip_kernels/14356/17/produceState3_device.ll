; ModuleID = '../data/hip_kernels/14356/17/main.cu'
source_filename = "../data/hip_kernels/14356/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13produceState3PKfiS0_PKiiPf(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add nsw i32 %4, %1
  %9 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %8
  %10 = icmp slt i32 %7, %1
  br i1 %10, label %11, label %18

11:                                               ; preds = %6
  %12 = zext i32 %7 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %7
  store float %14, float addrspace(3)* %15, align 4, !tbaa !5
  %16 = getelementptr inbounds float, float addrspace(3)* %9, i32 %7
  %17 = bitcast float addrspace(3)* %16 to i32 addrspace(3)*
  store i32 1, i32 addrspace(3)* %17, align 4, !tbaa !10
  br label %21

18:                                               ; preds = %6
  %19 = getelementptr inbounds float, float addrspace(3)* %9, i32 %7
  %20 = bitcast float addrspace(3)* %19 to i32 addrspace(3)*
  store i32 0, i32 addrspace(3)* %20, align 4, !tbaa !10
  br label %21

21:                                               ; preds = %18, %11
  %22 = phi i32 addrspace(3)* [ %20, %18 ], [ %17, %11 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !12, !invariant.load !9
  %27 = zext i16 %26 to i32
  %28 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !10
  %29 = mul i32 %28, %27
  %30 = add i32 %29, %7
  %31 = icmp ult i32 %30, %8
  br i1 %31, label %32, label %106

32:                                               ; preds = %21, %101
  %33 = phi i32 [ %104, %101 ], [ %30, %21 ]
  %34 = phi i32 [ %102, %101 ], [ %28, %21 ]
  %35 = sub nsw i32 %33, %1
  %36 = mul nsw i32 %35, 3
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !10, !amdgpu.noclobber !9
  %40 = add nsw i32 %36, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !10, !amdgpu.noclobber !9
  %44 = add nsw i32 %36, 2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !10, !amdgpu.noclobber !9
  %48 = icmp slt i32 %39, %43
  br i1 %48, label %54, label %67

49:                                               ; preds = %54
  %50 = icmp slt i32 %66, %43
  br i1 %50, label %54, label %51, !llvm.loop !13

51:                                               ; preds = %49
  br i1 %48, label %52, label %67

52:                                               ; preds = %51
  %53 = sub i32 %47, %39
  br label %88

54:                                               ; preds = %32, %49
  %55 = phi i32 [ %66, %49 ], [ %39, %32 ]
  %56 = freeze i32 %55
  %57 = freeze i32 %27
  %58 = udiv i32 %56, %57
  %59 = mul i32 %58, %57
  %60 = sub i32 %56, %59
  %61 = add i32 %58, 1
  %62 = getelementptr inbounds float, float addrspace(3)* %9, i32 %60
  %63 = bitcast float addrspace(3)* %62 to i32 addrspace(3)*
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !10
  %65 = icmp slt i32 %64, %61
  %66 = add nsw i32 %55, 1
  br i1 %65, label %101, label %49

67:                                               ; preds = %88, %32, %51
  %68 = phi float [ 0.000000e+00, %51 ], [ 0.000000e+00, %32 ], [ %98, %88 ]
  %69 = fneg contract float %68
  %70 = fmul float %68, 0xBFF7154760000000
  %71 = tail call float @llvm.rint.f32(float %70)
  %72 = fcmp olt float %68, 0xC0562E4300000000
  %73 = fcmp ogt float %68, 0x4059D1DA00000000
  %74 = fneg float %70
  %75 = tail call float @llvm.fma.f32(float %69, float 0x3FF7154760000000, float %74)
  %76 = tail call float @llvm.fma.f32(float %69, float 0x3E54AE0BE0000000, float %75)
  %77 = fsub float %70, %71
  %78 = fadd float %76, %77
  %79 = tail call float @llvm.exp2.f32(float %78)
  %80 = fptosi float %71 to i32
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 %80)
  %82 = fadd contract float %81, 1.000000e+00
  %83 = fdiv contract float 1.000000e+00, %82
  %84 = select i1 %73, float 1.000000e+00, float %83
  %85 = select i1 %72, float 0.000000e+00, float %84
  %86 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %33
  store float %85, float addrspace(3)* %86, align 4, !tbaa !5
  %87 = add nsw i32 %34, 1
  store i32 %87, i32 addrspace(3)* %22, align 4, !tbaa !10
  br label %101

88:                                               ; preds = %52, %88
  %89 = phi i32 [ %39, %52 ], [ %99, %88 ]
  %90 = phi float [ 0.000000e+00, %52 ], [ %98, %88 ]
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %89
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %93 = add i32 %53, %89
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %90, %97
  %99 = add nsw i32 %89, 1
  %100 = icmp slt i32 %99, %43
  br i1 %100, label %88, label %67, !llvm.loop !15

101:                                              ; preds = %54, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !10
  %103 = mul i32 %102, %27
  %104 = add i32 %103, %7
  %105 = icmp ult i32 %104, %8
  br i1 %105, label %32, label %106, !llvm.loop !16

106:                                              ; preds = %101, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = icmp slt i32 %7, %8
  br i1 %107, label %108, label %116

108:                                              ; preds = %106, %108
  %109 = phi i32 [ %114, %108 ], [ %7, %106 ]
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %109
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !5
  %113 = getelementptr inbounds float, float addrspace(1)* %5, i64 %110
  store float %112, float addrspace(1)* %113, align 4, !tbaa !5
  %114 = add i32 %109, %27
  %115 = icmp slt i32 %114, %8
  br i1 %115, label %108, label %116, !llvm.loop !17

116:                                              ; preds = %108, %106
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = !{i16 1, i16 1025}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
