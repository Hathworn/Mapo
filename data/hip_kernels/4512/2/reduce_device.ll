; ModuleID = '../data/hip_kernels/4512/2/main.cu'
source_filename = "../data/hip_kernels/4512/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @reduce(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = shl i32 %5, 1
  %15 = mul i32 %14, %10
  %16 = add i32 %15, %4
  %17 = shl nuw nsw i32 %10, 1
  %18 = udiv i32 %13, %10
  %19 = mul i32 %18, %10
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %17, %22
  %24 = icmp ult i32 %16, %2
  br i1 %24, label %25, label %43

25:                                               ; preds = %3, %39
  %26 = phi i32 [ %41, %39 ], [ %16, %3 ]
  %27 = phi float [ %40, %39 ], [ 0.000000e+00, %3 ]
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !6
  %31 = fadd contract float %27, %30
  %32 = add i32 %26, %10
  %33 = icmp ult i32 %32, %2
  br i1 %33, label %34, label %39

34:                                               ; preds = %25
  %35 = zext i32 %32 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !6
  %38 = fadd contract float %31, %37
  br label %39

39:                                               ; preds = %34, %25
  %40 = phi float [ %38, %34 ], [ %31, %25 ]
  %41 = add i32 %26, %23
  %42 = icmp ult i32 %41, %2
  br i1 %42, label %25, label %43, !llvm.loop !20

43:                                               ; preds = %39, %3
  %44 = phi float [ 0.000000e+00, %3 ], [ %40, %39 ]
  %45 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  store float %44, float addrspace(3)* %45, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ugt i16 %9, 511
  br i1 %46, label %47, label %56

47:                                               ; preds = %43
  %48 = icmp ult i32 %4, 256
  br i1 %48, label %49, label %54

49:                                               ; preds = %47
  %50 = add nuw nsw i32 %4, 256
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !16
  %53 = fadd contract float %44, %52
  store float %53, float addrspace(3)* %45, align 4, !tbaa !16
  br label %54

54:                                               ; preds = %49, %47
  %55 = phi float [ %53, %49 ], [ %44, %47 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %56

56:                                               ; preds = %54, %43
  %57 = phi float [ %55, %54 ], [ %44, %43 ]
  %58 = icmp ugt i16 %9, 255
  br i1 %58, label %59, label %68

59:                                               ; preds = %56
  %60 = icmp ult i32 %4, 128
  br i1 %60, label %61, label %66

61:                                               ; preds = %59
  %62 = add nuw nsw i32 %4, 128
  %63 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !16
  %65 = fadd contract float %57, %64
  store float %65, float addrspace(3)* %45, align 4, !tbaa !16
  br label %66

66:                                               ; preds = %61, %59
  %67 = phi float [ %65, %61 ], [ %57, %59 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %68

68:                                               ; preds = %66, %56
  %69 = phi float [ %67, %66 ], [ %57, %56 ]
  %70 = icmp ugt i16 %9, 127
  br i1 %70, label %71, label %80

71:                                               ; preds = %68
  %72 = icmp ult i32 %4, 64
  br i1 %72, label %73, label %78

73:                                               ; preds = %71
  %74 = add nuw nsw i32 %4, 64
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !16
  %77 = fadd contract float %69, %76
  store float %77, float addrspace(3)* %45, align 4, !tbaa !16
  br label %78

78:                                               ; preds = %73, %71
  %79 = phi float [ %77, %73 ], [ %69, %71 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %80

80:                                               ; preds = %78, %68
  %81 = phi float [ %79, %78 ], [ %69, %68 ]
  %82 = icmp ult i32 %4, 32
  br i1 %82, label %83, label %142

83:                                               ; preds = %80
  %84 = icmp ugt i16 %9, 63
  br i1 %84, label %85, label %92

85:                                               ; preds = %83
  %86 = add nuw nsw i32 %4, 32
  %87 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %86
  %88 = addrspacecast float addrspace(3)* %87 to float*
  %89 = load volatile float, float* %88, align 4, !tbaa !16
  %90 = fadd contract float %81, %89
  %91 = addrspacecast float addrspace(3)* %45 to float*
  store volatile float %90, float* %91, align 4, !tbaa !16
  br label %92

92:                                               ; preds = %85, %83
  %93 = phi float [ %90, %85 ], [ %81, %83 ]
  %94 = icmp ugt i16 %9, 31
  br i1 %94, label %95, label %102

95:                                               ; preds = %92
  %96 = add nuw nsw i32 %4, 16
  %97 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %96
  %98 = addrspacecast float addrspace(3)* %97 to float*
  %99 = load volatile float, float* %98, align 4, !tbaa !16
  %100 = fadd contract float %93, %99
  %101 = addrspacecast float addrspace(3)* %45 to float*
  store volatile float %100, float* %101, align 4, !tbaa !16
  br label %102

102:                                              ; preds = %95, %92
  %103 = phi float [ %100, %95 ], [ %93, %92 ]
  %104 = icmp ugt i16 %9, 15
  br i1 %104, label %105, label %112

105:                                              ; preds = %102
  %106 = add nuw nsw i32 %4, 8
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %106
  %108 = addrspacecast float addrspace(3)* %107 to float*
  %109 = load volatile float, float* %108, align 4, !tbaa !16
  %110 = fadd contract float %103, %109
  %111 = addrspacecast float addrspace(3)* %45 to float*
  store volatile float %110, float* %111, align 4, !tbaa !16
  br label %112

112:                                              ; preds = %105, %102
  %113 = phi float [ %110, %105 ], [ %103, %102 ]
  %114 = icmp ugt i16 %9, 7
  br i1 %114, label %115, label %122

115:                                              ; preds = %112
  %116 = add nuw nsw i32 %4, 4
  %117 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %116
  %118 = addrspacecast float addrspace(3)* %117 to float*
  %119 = load volatile float, float* %118, align 4, !tbaa !16
  %120 = fadd contract float %113, %119
  %121 = addrspacecast float addrspace(3)* %45 to float*
  store volatile float %120, float* %121, align 4, !tbaa !16
  br label %122

122:                                              ; preds = %115, %112
  %123 = phi float [ %120, %115 ], [ %113, %112 ]
  %124 = icmp ugt i16 %9, 3
  br i1 %124, label %125, label %132

125:                                              ; preds = %122
  %126 = add nuw nsw i32 %4, 2
  %127 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %126
  %128 = addrspacecast float addrspace(3)* %127 to float*
  %129 = load volatile float, float* %128, align 4, !tbaa !16
  %130 = fadd contract float %123, %129
  %131 = addrspacecast float addrspace(3)* %45 to float*
  store volatile float %130, float* %131, align 4, !tbaa !16
  br label %132

132:                                              ; preds = %125, %122
  %133 = phi float [ %130, %125 ], [ %123, %122 ]
  %134 = icmp ugt i16 %9, 1
  br i1 %134, label %135, label %142

135:                                              ; preds = %132
  %136 = add nuw nsw i32 %4, 1
  %137 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %136
  %138 = addrspacecast float addrspace(3)* %137 to float*
  %139 = load volatile float, float* %138, align 4, !tbaa !16
  %140 = fadd contract float %133, %139
  %141 = addrspacecast float addrspace(3)* %45 to float*
  store volatile float %140, float* %141, align 4, !tbaa !16
  br label %142

142:                                              ; preds = %132, %135, %80
  %143 = icmp eq i32 %4, 0
  br i1 %143, label %144, label %148

144:                                              ; preds = %142
  %145 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  %146 = zext i32 %5 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  store float %145, float addrspace(1)* %147, align 4, !tbaa !16
  br label %148

148:                                              ; preds = %144, %142
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
