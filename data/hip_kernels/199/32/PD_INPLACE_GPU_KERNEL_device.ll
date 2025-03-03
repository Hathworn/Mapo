; ModuleID = '../data/hip_kernels/199/32/main.cu'
source_filename = "../data/hip_kernels/199/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_input = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21PD_INPLACE_GPU_KERNELPfS_PhS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = load float, float addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = getelementptr inbounds float, float addrspace(1)* %3, i64 2
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = getelementptr inbounds float, float addrspace(1)* %3, i64 1
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !4, !amdgpu.noclobber !8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = mul i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl i32 %14, 10
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %17 = or i32 %15, %16
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !10, !invariant.load !8
  %22 = zext i16 %21 to i32
  %23 = icmp slt i32 %17, %5
  br i1 %23, label %24, label %30

24:                                               ; preds = %6
  %25 = add nsw i32 %17, %13
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !4, !amdgpu.noclobber !8
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %16
  store float %28, float addrspace(3)* %29, align 4, !tbaa !4
  br label %30

30:                                               ; preds = %24, %6
  %31 = add nuw nsw i32 %16, %22
  %32 = add i32 %17, %22
  %33 = icmp slt i32 %32, %5
  br i1 %33, label %34, label %40

34:                                               ; preds = %30
  %35 = add nsw i32 %32, %13
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4, !amdgpu.noclobber !8
  %39 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %31
  store float %38, float addrspace(3)* %39, align 4, !tbaa !4
  br label %40

40:                                               ; preds = %34, %30
  %41 = add nuw nsw i32 %31, %22
  %42 = add nsw i32 %4, 1023
  %43 = add nsw i32 %4, -1
  %44 = mul i32 %43, %12
  %45 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %46 = bitcast i8 addrspace(4)* %45 to i32 addrspace(4)*
  %47 = load i32, i32 addrspace(4)* %46, align 4, !tbaa !11
  %48 = udiv i32 %47, %22
  %49 = mul i32 %48, %22
  %50 = icmp ugt i32 %47, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = mul i32 %44, %52
  %54 = icmp slt i32 %41, %42
  br i1 %54, label %55, label %69

55:                                               ; preds = %40
  %56 = mul i32 %43, %14
  %57 = add i32 %56, %16
  br label %58

58:                                               ; preds = %55, %58
  %59 = phi i32 [ %67, %58 ], [ %57, %55 ]
  %60 = phi i32 [ %66, %58 ], [ %41, %55 ]
  %61 = add nsw i32 %59, %53
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4, !amdgpu.noclobber !8
  %65 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %60
  store float %64, float addrspace(3)* %65, align 4, !tbaa !4
  %66 = add i32 %60, %22
  %67 = add i32 %59, %22
  %68 = icmp slt i32 %66, %42
  br i1 %68, label %58, label %69, !llvm.loop !20

69:                                               ; preds = %58, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = shl nuw nsw i32 %16, 1
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !4
  %73 = fsub contract float %72, %7
  %74 = fdiv contract float %73, %9
  %75 = insertelement <2 x float> undef, float %74, i64 0
  %76 = add nuw nsw i32 %70, 1
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !4
  %79 = fsub contract float %78, %7
  %80 = fdiv contract float %79, %9
  %81 = insertelement <2 x float> %75, float %80, i64 1
  %82 = icmp sgt i32 %4, 1
  br i1 %82, label %83, label %122

83:                                               ; preds = %69, %83
  %84 = phi i32 [ %95, %83 ], [ 1, %69 ]
  %85 = phi float [ %94, %83 ], [ %72, %69 ]
  %86 = phi <2 x i32> [ %118, %83 ], [ <i32 1, i32 1>, %69 ]
  %87 = phi <2 x float> [ %117, %83 ], [ %81, %69 ]
  %88 = sitofp i32 %84 to float
  %89 = fmul contract float %11, %88
  %90 = fadd contract float %9, %89
  %91 = add nuw nsw i32 %84, %70
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !4
  %94 = fadd contract float %85, %93
  %95 = add nuw nsw i32 %84, 1
  %96 = sitofp i32 %95 to float
  %97 = fmul contract float %7, %96
  %98 = fsub contract float %94, %97
  %99 = fdiv contract float %98, %90
  %100 = extractelement <2 x float> %87, i64 0
  %101 = fcmp contract ogt float %99, %100
  %102 = insertelement <2 x float> %87, float %99, i64 0
  %103 = insertelement <2 x i32> %86, i32 %95, i64 0
  %104 = select i1 %101, <2 x float> %102, <2 x float> %87
  %105 = select i1 %101, <2 x i32> %103, <2 x i32> %86
  %106 = add nuw nsw i32 %91, 1
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_input, i32 0, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !4
  %109 = fsub contract float %94, %72
  %110 = fadd contract float %109, %108
  %111 = fsub contract float %110, %97
  %112 = fdiv contract float %111, %90
  %113 = extractelement <2 x float> %104, i64 1
  %114 = fcmp contract ogt float %112, %113
  %115 = insertelement <2 x float> %104, float %112, i64 1
  %116 = insertelement <2 x i32> %105, i32 %95, i64 1
  %117 = select i1 %114, <2 x float> %115, <2 x float> %104
  %118 = select i1 %114, <2 x i32> %116, <2 x i32> %105
  %119 = icmp eq i32 %95, %4
  br i1 %119, label %120, label %83, !llvm.loop !22

120:                                              ; preds = %83
  %121 = bitcast <2 x i32> %118 to <8 x i8>
  br label %122

122:                                              ; preds = %120, %69
  %123 = phi <2 x float> [ %81, %69 ], [ %117, %120 ]
  %124 = phi <8 x i8> [ <i8 1, i8 0, i8 0, i8 0, i8 1, i8 0, i8 0, i8 0>, %69 ], [ %121, %120 ]
  %125 = add i32 %15, %70
  %126 = icmp slt i32 %125, %5
  br i1 %126, label %127, label %134

127:                                              ; preds = %122
  %128 = extractelement <2 x float> %123, i64 0
  %129 = add i32 %125, %13
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  store float %128, float addrspace(1)* %131, align 4, !tbaa !4
  %132 = extractelement <8 x i8> %124, i64 0
  %133 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %130
  store i8 %132, i8 addrspace(1)* %133, align 1, !tbaa !23
  br label %134

134:                                              ; preds = %122, %127
  %135 = or i32 %125, 1
  %136 = icmp slt i32 %135, %5
  br i1 %136, label %137, label %144

137:                                              ; preds = %134
  %138 = extractelement <2 x float> %123, i64 1
  %139 = add i32 %135, %13
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  store float %138, float addrspace(1)* %141, align 4, !tbaa !4
  %142 = extractelement <8 x i8> %124, i64 4
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %140
  store i8 %142, i8 addrspace(1)* %143, align 1, !tbaa !23
  br label %144

144:                                              ; preds = %137, %134
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = !{!6, !6, i64 0}
