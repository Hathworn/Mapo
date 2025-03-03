; ModuleID = '../data/hip_kernels/16910/16/main.cu'
source_filename = "../data/hip_kernels/16910/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bestFilterPKdPKfS2_PfS3_Pi(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !5, !amdgpu.noclobber !9
  %13 = fptosi double %12 to i32
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !5, !amdgpu.noclobber !9
  %16 = fptrunc double %15 to float
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !5, !amdgpu.noclobber !9
  %19 = fptosi double %18 to i32
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !10, !invariant.load !9
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !11
  %28 = mul i32 %8, %24
  %29 = add i32 %28, %7
  %30 = sub nsw i32 %10, %19
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %159

32:                                               ; preds = %6
  %33 = icmp sgt i32 %13, 0
  %34 = fadd contract float %16, 1.000000e+00
  %35 = udiv i32 %27, %24
  %36 = mul i32 %35, %24
  %37 = icmp ugt i32 %27, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %24
  %41 = and i32 %13, 1
  %42 = icmp eq i32 %13, 1
  %43 = and i32 %13, -2
  %44 = icmp eq i32 %41, 0
  br label %45

45:                                               ; preds = %32, %148
  %46 = phi i32 [ %29, %32 ], [ %157, %148 ]
  %47 = phi i32 [ 0, %32 ], [ %150, %148 ]
  br i1 %33, label %48, label %148

48:                                               ; preds = %45
  br i1 %42, label %115, label %49

49:                                               ; preds = %48, %108
  %50 = phi float [ %111, %108 ], [ 0.000000e+00, %48 ]
  %51 = phi i32 [ %112, %108 ], [ 0, %48 ]
  %52 = phi i32 [ %110, %108 ], [ %47, %48 ]
  %53 = phi float [ %109, %108 ], [ 0.000000e+00, %48 ]
  %54 = phi i32 [ %113, %108 ], [ 0, %48 ]
  %55 = mul nsw i32 %51, %10
  %56 = add nsw i32 %55, %46
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !20
  %60 = tail call float @llvm.maxnum.f32(float %59, float 0.000000e+00)
  %61 = zext i32 %51 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !20
  %64 = fmul contract float %63, %16
  %65 = fadd contract float %60, %64
  %66 = fmul contract float %65, %65
  %67 = fdiv contract float %66, %34
  %68 = fmul contract float %63, %64
  %69 = fsub contract float %67, %68
  %70 = fpext float %69 to double
  %71 = fpext float %53 to double
  %72 = fadd contract double %71, 0x3EB0C6F7A0B5ED8D
  %73 = fcmp contract olt double %72, %70
  br i1 %73, label %79, label %74

74:                                               ; preds = %49
  %75 = fpext float %50 to double
  %76 = fadd contract double %75, 0x3EB0C6F7A0B5ED8D
  %77 = fcmp contract olt double %76, %70
  %78 = select i1 %77, float %69, float %50
  br label %79

79:                                               ; preds = %74, %49
  %80 = phi float [ %69, %49 ], [ %53, %74 ]
  %81 = phi i32 [ %51, %49 ], [ %52, %74 ]
  %82 = phi float [ %53, %49 ], [ %78, %74 ]
  %83 = or i32 %51, 1
  %84 = mul nsw i32 %83, %10
  %85 = add nsw i32 %84, %46
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !20
  %89 = tail call float @llvm.maxnum.f32(float %88, float 0.000000e+00)
  %90 = zext i32 %83 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !20
  %93 = fmul contract float %92, %16
  %94 = fadd contract float %89, %93
  %95 = fmul contract float %94, %94
  %96 = fdiv contract float %95, %34
  %97 = fmul contract float %92, %93
  %98 = fsub contract float %96, %97
  %99 = fpext float %98 to double
  %100 = fpext float %80 to double
  %101 = fadd contract double %100, 0x3EB0C6F7A0B5ED8D
  %102 = fcmp contract olt double %101, %99
  br i1 %102, label %108, label %103

103:                                              ; preds = %79
  %104 = fpext float %82 to double
  %105 = fadd contract double %104, 0x3EB0C6F7A0B5ED8D
  %106 = fcmp contract olt double %105, %99
  %107 = select i1 %106, float %98, float %82
  br label %108

108:                                              ; preds = %103, %79
  %109 = phi float [ %98, %79 ], [ %80, %103 ]
  %110 = phi i32 [ %83, %79 ], [ %81, %103 ]
  %111 = phi float [ %80, %79 ], [ %107, %103 ]
  %112 = add nuw nsw i32 %51, 2
  %113 = add i32 %54, 2
  %114 = icmp eq i32 %113, %43
  br i1 %114, label %115, label %49, !llvm.loop !22

115:                                              ; preds = %108, %48
  %116 = phi float [ undef, %48 ], [ %109, %108 ]
  %117 = phi i32 [ undef, %48 ], [ %110, %108 ]
  %118 = phi float [ undef, %48 ], [ %111, %108 ]
  %119 = phi float [ 0.000000e+00, %48 ], [ %111, %108 ]
  %120 = phi i32 [ 0, %48 ], [ %112, %108 ]
  %121 = phi i32 [ %47, %48 ], [ %110, %108 ]
  %122 = phi float [ 0.000000e+00, %48 ], [ %109, %108 ]
  br i1 %44, label %148, label %123

123:                                              ; preds = %115
  %124 = mul nsw i32 %120, %10
  %125 = add nsw i32 %124, %46
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !20
  %129 = tail call float @llvm.maxnum.f32(float %128, float 0.000000e+00)
  %130 = zext i32 %120 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !20
  %133 = fmul contract float %132, %16
  %134 = fadd contract float %129, %133
  %135 = fmul contract float %134, %134
  %136 = fdiv contract float %135, %34
  %137 = fmul contract float %132, %133
  %138 = fsub contract float %136, %137
  %139 = fpext float %138 to double
  %140 = fpext float %122 to double
  %141 = fadd contract double %140, 0x3EB0C6F7A0B5ED8D
  %142 = fcmp contract olt double %141, %139
  br i1 %142, label %148, label %143

143:                                              ; preds = %123
  %144 = fpext float %119 to double
  %145 = fadd contract double %144, 0x3EB0C6F7A0B5ED8D
  %146 = fcmp contract olt double %145, %139
  %147 = select i1 %146, float %138, float %119
  br label %148

148:                                              ; preds = %115, %143, %123, %45
  %149 = phi float [ 0.000000e+00, %45 ], [ %116, %115 ], [ %138, %123 ], [ %122, %143 ]
  %150 = phi i32 [ %47, %45 ], [ %117, %115 ], [ %120, %123 ], [ %121, %143 ]
  %151 = phi float [ 0.000000e+00, %45 ], [ %118, %115 ], [ %122, %123 ], [ %147, %143 ]
  %152 = sext i32 %46 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  store float %149, float addrspace(1)* %153, align 4, !tbaa !20
  %154 = fsub contract float %149, %151
  %155 = getelementptr inbounds float, float addrspace(1)* %4, i64 %152
  store float %154, float addrspace(1)* %155, align 4, !tbaa !20
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %152
  store i32 %150, i32 addrspace(1)* %156, align 4, !tbaa !24
  %157 = add i32 %40, %46
  %158 = icmp slt i32 %157, %30
  br i1 %158, label %45, label %159, !llvm.loop !26

159:                                              ; preds = %148, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
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
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !7, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !7, i64 0}
!26 = distinct !{!26, !23}
