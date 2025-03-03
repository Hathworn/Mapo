; ModuleID = '../data/hip_kernels/14835/15/main.cu'
source_filename = "../data/hip_kernels/14835/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandStateMtgp32 = type { %"class.rocrand_device::mtgp32_engine" }
%"class.rocrand_device::mtgp32_engine" = type { %"struct.rocrand_device::mtgp32_state", i32, [16 x i32], [16 x i32], i32, i32, [16 x i32], i32 }
%"struct.rocrand_device::mtgp32_state" = type { i32, i32, [1024 x i32] }

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z32sampleMultinomialWithReplacementP18hiprandStateMtgp32iPfliS1_(%struct.hiprandStateMtgp32 addrspace(1)* nocapture %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i64 %3, i32 %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = icmp slt i64 %8, %3
  br i1 %9, label %10, label %47

10:                                               ; preds = %6
  %11 = icmp sgt i32 %1, 0
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %14 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 1
  %18 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 0, i32 0
  %19 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 7
  %20 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 4
  %21 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 5
  %22 = icmp eq i32 %13, 0
  %23 = sext i32 %4 to i64
  %24 = icmp sgt i32 %4, 0
  %25 = sext i32 %1 to i64
  %26 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 4, !tbaa !4
  %31 = load i16, i16 addrspace(4)* %16, align 4, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %30, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %30, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = zext i32 %37 to i64
  br label %39

39:                                               ; preds = %10, %48
  %40 = phi i64 [ %8, %10 ], [ %49, %48 ]
  br i1 %11, label %41, label %48

41:                                               ; preds = %39
  %42 = mul nsw i64 %40, %23
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  %44 = mul nsw i64 %40, %25
  %45 = load i16, i16 addrspace(4)* %27, align 2, !range !13, !invariant.load !14
  %46 = zext i16 %45 to i32
  br label %51

47:                                               ; preds = %48, %6
  ret void

48:                                               ; preds = %138, %39
  %49 = add nuw nsw i64 %40, %38
  %50 = icmp slt i64 %49, %3
  br i1 %50, label %39, label %47, !llvm.loop !15

51:                                               ; preds = %41, %138
  %52 = phi i32 [ 0, %41 ], [ %139, %138 ]
  %53 = add i32 %52, %12
  %54 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !17
  %55 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !23
  %56 = add i32 %55, %13
  %57 = and i32 %56, 1023
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 0, i32 2, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !24
  %61 = add i32 %56, 1
  %62 = and i32 %61, 1023
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 0, i32 2, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !24
  %66 = add i32 %56, %54
  %67 = and i32 %66, 1023
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 0, i32 2, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !24
  %71 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !25
  %72 = and i32 %71, %60
  %73 = xor i32 %72, %65
  %74 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !26
  %75 = shl i32 %73, %74
  %76 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !27
  %77 = lshr i32 %70, %76
  %78 = xor i32 %75, %77
  %79 = xor i32 %78, %73
  %80 = and i32 %79, 15
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 2, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !24
  %84 = xor i32 %79, %83
  %85 = add i32 %56, 351
  %86 = and i32 %85, 1023
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 0, i32 2, i64 %87
  store i32 %84, i32 addrspace(1)* %88, align 4, !tbaa !24
  %89 = add i32 %66, 1023
  %90 = and i32 %89, 1023
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 0, i32 2, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !24
  %94 = lshr i32 %93, 16
  %95 = xor i32 %94, %93
  %96 = lshr i32 %95, 8
  %97 = xor i32 %96, %95
  %98 = and i32 %97, 15
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds %struct.hiprandStateMtgp32, %struct.hiprandStateMtgp32 addrspace(1)* %0, i64 %8, i32 0, i32 3, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %102, label %106

102:                                              ; preds = %51
  %103 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !23
  %104 = add i32 %103, %32
  %105 = and i32 %104, 1023
  store i32 %105, i32 addrspace(1)* %18, align 4, !tbaa !23
  br label %106

106:                                              ; preds = %51, %102
  %107 = xor i32 %101, %84
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = uitofp i32 %107 to float
  %109 = fmul contract float %108, 0x3DF0000000000000
  %110 = fadd contract float %109, 0x3DF0000000000000
  %111 = icmp slt i32 %53, %1
  %112 = select i1 %22, i1 %111, i1 false
  br i1 %112, label %113, label %138

113:                                              ; preds = %106
  br i1 %24, label %114, label %129

114:                                              ; preds = %113, %114
  %115 = phi i32 [ %127, %114 ], [ %4, %113 ]
  %116 = phi i32 [ %126, %114 ], [ 0, %113 ]
  %117 = phi i32 [ %125, %114 ], [ %4, %113 ]
  %118 = lshr i32 %115, 1
  %119 = add nsw i32 %118, %116
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %43, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !28
  %123 = fcmp contract olt float %122, %110
  %124 = add nsw i32 %119, 1
  %125 = select i1 %123, i32 %117, i32 %119
  %126 = select i1 %123, i32 %124, i32 %116
  %127 = sub nsw i32 %125, %126
  %128 = icmp sgt i32 %127, 0
  br i1 %128, label %114, label %129, !llvm.loop !30

129:                                              ; preds = %114, %113
  %130 = phi i32 [ 0, %113 ], [ %126, %114 ]
  %131 = icmp eq i32 %130, %4
  %132 = select i1 %131, i32 0, i32 %130
  %133 = sitofp i32 %132 to float
  %134 = fadd contract float %133, 1.000000e+00
  %135 = sext i32 %53 to i64
  %136 = add nsw i64 %44, %135
  %137 = getelementptr inbounds float, float addrspace(1)* %2, i64 %136
  store float %134, float addrspace(1)* %137, align 4, !tbaa !28
  br label %138

138:                                              ; preds = %129, %106
  %139 = add i32 %52, %46
  %140 = icmp slt i32 %139, %1
  br i1 %140, label %51, label %48, !llvm.loop !31
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!18, !20, i64 4104}
!18 = !{!"_ZTSN14rocrand_device13mtgp32_engineE", !19, i64 0, !20, i64 4104, !21, i64 4108, !21, i64 4172, !20, i64 4236, !20, i64 4240, !21, i64 4244, !20, i64 4308}
!19 = !{!"_ZTSN14rocrand_device12mtgp32_stateE", !20, i64 0, !20, i64 4, !21, i64 8}
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!18, !20, i64 0}
!24 = !{!20, !20, i64 0}
!25 = !{!18, !20, i64 4308}
!26 = !{!18, !20, i64 4236}
!27 = !{!18, !20, i64 4240}
!28 = !{!29, !29, i64 0}
!29 = !{!"float", !21, i64 0}
!30 = distinct !{!30, !16}
!31 = distinct !{!31, !16}
