; ModuleID = '../data/hip_kernels/14856/16/main.cu'
source_filename = "../data/hip_kernels/14856/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandStateMtgp32 = type { %"class.rocrand_device::mtgp32_engine" }
%"class.rocrand_device::mtgp32_engine" = type { %"struct.rocrand_device::mtgp32_state", i32, [16 x i32], [16 x i32], i32, i32, [16 x i32], i32 }
%"struct.rocrand_device::mtgp32_state" = type { i32, i32, [1024 x i32] }

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z35sampleMultinomialWithoutReplacementP18hiprandStateMtgp32iiPfliS1_S1_(%struct.hiprandStateMtgp32 addrspace(1)* nocapture %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i64 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = zext i32 %15 to i64
  %17 = icmp slt i64 %16, %4
  br i1 %17, label %18, label %47

18:                                               ; preds = %8
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = zext i32 %19 to i64
  %21 = zext i32 %9 to i64
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !7
  %30 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 1
  %31 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 0, i32 0
  %32 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 7
  %33 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 4
  %34 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 5
  %35 = icmp eq i32 %22, 0
  %36 = sext i32 %5 to i64
  %37 = icmp sgt i32 %5, 0
  %38 = sext i32 %1 to i64
  %39 = sext i32 %2 to i64
  %40 = udiv i32 %29, %26
  %41 = mul i32 %40, %26
  %42 = icmp ugt i32 %29, %41
  %43 = zext i1 %42 to i32
  %44 = add i32 %40, %43
  %45 = mul i32 %44, %14
  %46 = zext i32 %45 to i64
  br label %48

47:                                               ; preds = %140, %8
  ret void

48:                                               ; preds = %18, %140
  %49 = phi i64 [ %16, %18 ], [ %141, %140 ]
  %50 = add nuw nsw i64 %49, %20
  %51 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !16
  %52 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !22
  %53 = add i32 %52, %22
  %54 = and i32 %53, 1023
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 0, i32 2, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !23
  %58 = add i32 %53, 1
  %59 = and i32 %58, 1023
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 0, i32 2, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !23
  %63 = add i32 %53, %51
  %64 = and i32 %63, 1023
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 0, i32 2, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !23
  %68 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !24
  %69 = and i32 %68, %57
  %70 = xor i32 %69, %62
  %71 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !25
  %72 = shl i32 %70, %71
  %73 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !26
  %74 = lshr i32 %67, %73
  %75 = xor i32 %72, %74
  %76 = xor i32 %75, %70
  %77 = and i32 %76, 15
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 2, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !23
  %81 = xor i32 %76, %80
  %82 = add i32 %53, 351
  %83 = and i32 %82, 1023
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 0, i32 2, i64 %84
  store i32 %81, i32 addrspace(1)* %85, align 4, !tbaa !23
  %86 = add i32 %63, 1023
  %87 = and i32 %86, 1023
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 0, i32 2, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !23
  %91 = lshr i32 %90, 16
  %92 = xor i32 %91, %90
  %93 = lshr i32 %92, 8
  %94 = xor i32 %93, %92
  %95 = and i32 %94, 15
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %21, i32 0, i32 3, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %35, label %99, label %103

99:                                               ; preds = %48
  %100 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !22
  %101 = add i32 %100, %26
  %102 = and i32 %101, 1023
  store i32 %102, i32 addrspace(1)* %31, align 4, !tbaa !22
  br label %103

103:                                              ; preds = %48, %99
  %104 = xor i32 %98, %81
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = uitofp i32 %104 to float
  %106 = fmul contract float %105, 0x3DF0000000000000
  %107 = fadd contract float %106, 0x3DF0000000000000
  %108 = icmp slt i64 %50, %4
  %109 = select i1 %35, i1 %108, i1 false
  br i1 %109, label %110, label %140

110:                                              ; preds = %103
  %111 = mul nsw i64 %50, %36
  %112 = getelementptr inbounds float, float addrspace(1)* %7, i64 %111
  br i1 %37, label %113, label %128

113:                                              ; preds = %110, %113
  %114 = phi i32 [ %126, %113 ], [ %5, %110 ]
  %115 = phi i32 [ %125, %113 ], [ 0, %110 ]
  %116 = phi i32 [ %124, %113 ], [ %5, %110 ]
  %117 = lshr i32 %114, 1
  %118 = add nsw i32 %117, %115
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %112, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !27
  %122 = fcmp contract olt float %121, %107
  %123 = add nsw i32 %118, 1
  %124 = select i1 %122, i32 %116, i32 %118
  %125 = select i1 %122, i32 %123, i32 %115
  %126 = sub nsw i32 %124, %125
  %127 = icmp sgt i32 %126, 0
  br i1 %127, label %113, label %128, !llvm.loop !29

128:                                              ; preds = %113, %110
  %129 = phi i32 [ 0, %110 ], [ %125, %113 ]
  %130 = icmp eq i32 %129, %5
  %131 = select i1 %130, i32 0, i32 %129
  %132 = sitofp i32 %131 to float
  %133 = fadd contract float %132, 1.000000e+00
  %134 = mul nsw i64 %50, %38
  %135 = add nsw i64 %134, %39
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  store float %133, float addrspace(1)* %136, align 4, !tbaa !27
  %137 = sext i32 %131 to i64
  %138 = add nsw i64 %111, %137
  %139 = getelementptr inbounds float, float addrspace(1)* %6, i64 %138
  store float 0.000000e+00, float addrspace(1)* %139, align 4, !tbaa !27
  br label %140

140:                                              ; preds = %128, %103
  %141 = add nuw nsw i64 %49, %46
  %142 = icmp slt i64 %141, %4
  br i1 %142, label %48, label %47, !llvm.loop !31
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !19, i64 4104}
!17 = !{!"_ZTSN14rocrand_device13mtgp32_engineE", !18, i64 0, !19, i64 4104, !20, i64 4108, !20, i64 4172, !19, i64 4236, !19, i64 4240, !20, i64 4244, !19, i64 4308}
!18 = !{!"_ZTSN14rocrand_device12mtgp32_stateE", !19, i64 0, !19, i64 4, !20, i64 8}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!17, !19, i64 0}
!23 = !{!19, !19, i64 0}
!24 = !{!17, !19, i64 4308}
!25 = !{!17, !19, i64 4236}
!26 = !{!17, !19, i64 4240}
!27 = !{!28, !28, i64 0}
!28 = !{!"float", !20, i64 0}
!29 = distinct !{!29, !30}
!30 = !{!"llvm.loop.mustprogress"}
!31 = distinct !{!31, !30}
