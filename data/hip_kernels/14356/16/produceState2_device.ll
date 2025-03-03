; ModuleID = '../data/hip_kernels/14356/16/main.cu'
source_filename = "../data/hip_kernels/14356/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@_ZZ13produceState2PKfiS0_PKiiPfE7counter.0 = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13produceState2PKfiS0_PKiiPf(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add nsw i32 %4, %1
  %9 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %8
  %10 = bitcast float addrspace(3)* %9 to i8 addrspace(3)*
  %11 = icmp slt i32 %7, %8
  br i1 %11, label %12, label %23

12:                                               ; preds = %6
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  br label %18

18:                                               ; preds = %12, %18
  %19 = phi i32 [ %7, %12 ], [ %21, %18 ]
  %20 = getelementptr inbounds i8, i8 addrspace(3)* %10, i32 %19
  store i8 0, i8 addrspace(3)* %20, align 1, !tbaa !7
  %21 = add i32 %19, %17
  %22 = icmp slt i32 %21, %8
  br i1 %22, label %18, label %23, !llvm.loop !11

23:                                               ; preds = %18, %6
  %24 = icmp eq i32 %7, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %23
  store i32 %1, i32 addrspace(3)* @_ZZ13produceState2PKfiS0_PKiiPfE7counter.0, align 4, !tbaa !13
  br label %26

26:                                               ; preds = %25, %23
  %27 = icmp slt i32 %7, %1
  br i1 %27, label %28, label %34

28:                                               ; preds = %26
  %29 = zext i32 %7 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !15, !amdgpu.noclobber !6
  %32 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %7
  store float %31, float addrspace(3)* %32, align 4, !tbaa !15
  %33 = getelementptr inbounds i8, i8 addrspace(3)* %10, i32 %7
  store i8 1, i8 addrspace(3)* %33, align 1, !tbaa !7
  br label %34

34:                                               ; preds = %28, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = load i32, i32 addrspace(3)* @_ZZ13produceState2PKfiS0_PKiiPfE7counter.0, align 4, !tbaa !13
  %36 = icmp slt i32 %35, %8
  br i1 %36, label %37, label %41

37:                                               ; preds = %34
  %38 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %39 = getelementptr i8, i8 addrspace(4)* %38, i64 4
  %40 = bitcast i8 addrspace(4)* %39 to i16 addrspace(4)*
  br label %48

41:                                               ; preds = %128, %34
  br i1 %11, label %42, label %139

42:                                               ; preds = %41
  %43 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %44 = getelementptr i8, i8 addrspace(4)* %43, i64 4
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = load i16, i16 addrspace(4)* %45, align 4, !range !5, !invariant.load !6
  %47 = zext i16 %46 to i32
  br label %131

48:                                               ; preds = %37, %128
  %49 = phi i32 [ %35, %37 ], [ %129, %128 ]
  %50 = add nsw i32 %49, %7
  %51 = sub nsw i32 %50, %1
  %52 = icmp slt i32 %51, %4
  br i1 %52, label %53, label %105

53:                                               ; preds = %48
  %54 = mul nsw i32 %51, 3
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !13, !amdgpu.noclobber !6
  %58 = add nsw i32 %54, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !13, !amdgpu.noclobber !6
  %62 = add nsw i32 %54, 2
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !13, !amdgpu.noclobber !6
  %66 = icmp sgt i32 %61, %49
  br i1 %66, label %105, label %67

67:                                               ; preds = %53
  %68 = icmp slt i32 %57, %61
  br i1 %68, label %69, label %71

69:                                               ; preds = %67
  %70 = sub i32 %65, %57
  br label %92

71:                                               ; preds = %92, %67
  %72 = phi float [ 0.000000e+00, %67 ], [ %102, %92 ]
  %73 = fneg contract float %72
  %74 = fmul float %72, 0xBFF7154760000000
  %75 = tail call float @llvm.rint.f32(float %74)
  %76 = fcmp olt float %72, 0xC0562E4300000000
  %77 = fcmp ogt float %72, 0x4059D1DA00000000
  %78 = fneg float %74
  %79 = tail call float @llvm.fma.f32(float %73, float 0x3FF7154760000000, float %78)
  %80 = tail call float @llvm.fma.f32(float %73, float 0x3E54AE0BE0000000, float %79)
  %81 = fsub float %74, %75
  %82 = fadd float %80, %81
  %83 = tail call float @llvm.exp2.f32(float %82)
  %84 = fptosi float %75 to i32
  %85 = tail call float @llvm.amdgcn.ldexp.f32(float %83, i32 %84)
  %86 = fadd contract float %85, 1.000000e+00
  %87 = fdiv contract float 1.000000e+00, %86
  %88 = select i1 %77, float 1.000000e+00, float %87
  %89 = select i1 %76, float 0.000000e+00, float %88
  %90 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %50
  store float %89, float addrspace(3)* %90, align 4, !tbaa !15
  %91 = getelementptr inbounds i8, i8 addrspace(3)* %10, i32 %50
  store i8 1, i8 addrspace(3)* %91, align 1, !tbaa !7
  br label %105

92:                                               ; preds = %69, %92
  %93 = phi i32 [ %57, %69 ], [ %103, %92 ]
  %94 = phi float [ 0.000000e+00, %69 ], [ %102, %92 ]
  %95 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %93
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !15
  %97 = add i32 %70, %93
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !15, !amdgpu.noclobber !6
  %101 = fmul contract float %96, %100
  %102 = fadd contract float %94, %101
  %103 = add nsw i32 %93, 1
  %104 = icmp slt i32 %103, %61
  br i1 %104, label %92, label %71, !llvm.loop !17

105:                                              ; preds = %53, %71, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %106, label %128

106:                                              ; preds = %105
  %107 = load i32, i32 addrspace(3)* @_ZZ13produceState2PKfiS0_PKiiPfE7counter.0, align 4, !tbaa !13
  %108 = load i16, i16 addrspace(4)* %40, align 4, !range !5, !invariant.load !6
  %109 = zext i16 %108 to i32
  %110 = add i32 %107, %109
  %111 = icmp ult i32 %107, %110
  %112 = icmp slt i32 %107, %8
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %128

114:                                              ; preds = %106, %122
  %115 = phi i32 [ %124, %122 ], [ %107, %106 ]
  %116 = phi i32 [ %123, %122 ], [ %107, %106 ]
  %117 = getelementptr inbounds i8, i8 addrspace(3)* %10, i32 %115
  %118 = load i8, i8 addrspace(3)* %117, align 1, !tbaa !7, !range !18
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %122, label %120

120:                                              ; preds = %114
  %121 = add nsw i32 %116, 1
  store i32 %121, i32 addrspace(3)* @_ZZ13produceState2PKfiS0_PKiiPfE7counter.0, align 4, !tbaa !13
  br label %122

122:                                              ; preds = %114, %120
  %123 = phi i32 [ %116, %114 ], [ %121, %120 ]
  %124 = add nuw nsw i32 %115, 1
  %125 = icmp ult i32 %124, %110
  %126 = icmp slt i32 %124, %8
  %127 = select i1 %125, i1 %126, i1 false
  br i1 %127, label %114, label %128, !llvm.loop !19

128:                                              ; preds = %122, %106, %105
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = load i32, i32 addrspace(3)* @_ZZ13produceState2PKfiS0_PKiiPfE7counter.0, align 4, !tbaa !13
  %130 = icmp slt i32 %129, %8
  br i1 %130, label %48, label %41, !llvm.loop !20

131:                                              ; preds = %42, %131
  %132 = phi i32 [ %7, %42 ], [ %137, %131 ]
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %132
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !15
  %136 = getelementptr inbounds float, float addrspace(1)* %5, i64 %133
  store float %135, float addrspace(1)* %136, align 4, !tbaa !15
  %137 = add i32 %132, %47
  %138 = icmp slt i32 %137, %8
  br i1 %138, label %131, label %139, !llvm.loop !21

139:                                              ; preds = %131, %41
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !9, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !9, i64 0}
!17 = distinct !{!17, !12}
!18 = !{i8 0, i8 2}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
