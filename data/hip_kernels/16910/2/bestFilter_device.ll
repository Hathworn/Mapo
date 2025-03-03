; ModuleID = '../data/hip_kernels/16910/2/main.cu'
source_filename = "../data/hip_kernels/16910/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bestFilterPKdPKfPfPiS4_S4_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !5, !amdgpu.noclobber !9
  %13 = fptosi double %12 to i32
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !10, !invariant.load !9
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !11
  %22 = mul i32 %8, %18
  %23 = add i32 %22, %7
  %24 = icmp slt i32 %23, %10
  br i1 %24, label %25, label %161

25:                                               ; preds = %6
  %26 = icmp sgt i32 %13, 0
  %27 = udiv i32 %21, %18
  %28 = mul i32 %27, %18
  %29 = icmp ugt i32 %21, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %18
  %33 = and i32 %13, 3
  %34 = icmp ult i32 %13, 4
  %35 = and i32 %13, -4
  %36 = icmp eq i32 %33, 0
  br label %37

37:                                               ; preds = %25, %151
  %38 = phi float [ 0.000000e+00, %25 ], [ %154, %151 ]
  %39 = phi i32 [ %23, %25 ], [ %159, %151 ]
  %40 = phi i32 [ 0, %25 ], [ %152, %151 ]
  br i1 %26, label %41, label %151

41:                                               ; preds = %37
  br i1 %34, label %118, label %42

42:                                               ; preds = %41, %111
  %43 = phi float [ %114, %111 ], [ %38, %41 ]
  %44 = phi i32 [ %113, %111 ], [ 0, %41 ]
  %45 = phi i32 [ %112, %111 ], [ %40, %41 ]
  %46 = phi i32 [ %115, %111 ], [ 0, %41 ]
  %47 = phi i32 [ %116, %111 ], [ 0, %41 ]
  %48 = mul nsw i32 %46, %10
  %49 = add nsw i32 %48, %39
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %53 = fpext float %52 to double
  %54 = fpext float %43 to double
  %55 = fadd contract double %54, 0x3EB0C6F7A0B5ED8D
  %56 = fcmp contract olt double %55, %53
  br i1 %56, label %57, label %60

57:                                               ; preds = %42
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %50
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !22
  br label %60

60:                                               ; preds = %42, %57
  %61 = phi i32 [ %46, %57 ], [ %45, %42 ]
  %62 = phi i32 [ %59, %57 ], [ %44, %42 ]
  %63 = phi float [ %52, %57 ], [ %43, %42 ]
  %64 = or i32 %46, 1
  %65 = mul nsw i32 %64, %10
  %66 = add nsw i32 %65, %39
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !20
  %70 = fpext float %69 to double
  %71 = fpext float %63 to double
  %72 = fadd contract double %71, 0x3EB0C6F7A0B5ED8D
  %73 = fcmp contract olt double %72, %70
  br i1 %73, label %74, label %77

74:                                               ; preds = %60
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !22
  br label %77

77:                                               ; preds = %74, %60
  %78 = phi i32 [ %64, %74 ], [ %61, %60 ]
  %79 = phi i32 [ %76, %74 ], [ %62, %60 ]
  %80 = phi float [ %69, %74 ], [ %63, %60 ]
  %81 = or i32 %46, 2
  %82 = mul nsw i32 %81, %10
  %83 = add nsw i32 %82, %39
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !20
  %87 = fpext float %86 to double
  %88 = fpext float %80 to double
  %89 = fadd contract double %88, 0x3EB0C6F7A0B5ED8D
  %90 = fcmp contract olt double %89, %87
  br i1 %90, label %91, label %94

91:                                               ; preds = %77
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %84
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !22
  br label %94

94:                                               ; preds = %91, %77
  %95 = phi i32 [ %81, %91 ], [ %78, %77 ]
  %96 = phi i32 [ %93, %91 ], [ %79, %77 ]
  %97 = phi float [ %86, %91 ], [ %80, %77 ]
  %98 = or i32 %46, 3
  %99 = mul nsw i32 %98, %10
  %100 = add nsw i32 %99, %39
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !20
  %104 = fpext float %103 to double
  %105 = fpext float %97 to double
  %106 = fadd contract double %105, 0x3EB0C6F7A0B5ED8D
  %107 = fcmp contract olt double %106, %104
  br i1 %107, label %108, label %111

108:                                              ; preds = %94
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %101
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !22
  br label %111

111:                                              ; preds = %108, %94
  %112 = phi i32 [ %98, %108 ], [ %95, %94 ]
  %113 = phi i32 [ %110, %108 ], [ %96, %94 ]
  %114 = phi float [ %103, %108 ], [ %97, %94 ]
  %115 = add nuw nsw i32 %46, 4
  %116 = add i32 %47, 4
  %117 = icmp eq i32 %116, %35
  br i1 %117, label %118, label %42, !llvm.loop !24

118:                                              ; preds = %111, %41
  %119 = phi i32 [ undef, %41 ], [ %112, %111 ]
  %120 = phi i32 [ undef, %41 ], [ %113, %111 ]
  %121 = phi float [ undef, %41 ], [ %114, %111 ]
  %122 = phi float [ %38, %41 ], [ %114, %111 ]
  %123 = phi i32 [ 0, %41 ], [ %113, %111 ]
  %124 = phi i32 [ %40, %41 ], [ %112, %111 ]
  %125 = phi i32 [ 0, %41 ], [ %115, %111 ]
  br i1 %36, label %151, label %126

126:                                              ; preds = %118, %144
  %127 = phi float [ %147, %144 ], [ %122, %118 ]
  %128 = phi i32 [ %146, %144 ], [ %123, %118 ]
  %129 = phi i32 [ %145, %144 ], [ %124, %118 ]
  %130 = phi i32 [ %148, %144 ], [ %125, %118 ]
  %131 = phi i32 [ %149, %144 ], [ 0, %118 ]
  %132 = mul nsw i32 %130, %10
  %133 = add nsw i32 %132, %39
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !20
  %137 = fpext float %136 to double
  %138 = fpext float %127 to double
  %139 = fadd contract double %138, 0x3EB0C6F7A0B5ED8D
  %140 = fcmp contract olt double %139, %137
  br i1 %140, label %141, label %144

141:                                              ; preds = %126
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %134
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !22
  br label %144

144:                                              ; preds = %141, %126
  %145 = phi i32 [ %130, %141 ], [ %129, %126 ]
  %146 = phi i32 [ %143, %141 ], [ %128, %126 ]
  %147 = phi float [ %136, %141 ], [ %127, %126 ]
  %148 = add nuw nsw i32 %130, 1
  %149 = add i32 %131, 1
  %150 = icmp eq i32 %149, %33
  br i1 %150, label %151, label %126, !llvm.loop !26

151:                                              ; preds = %118, %144, %37
  %152 = phi i32 [ %40, %37 ], [ %119, %118 ], [ %145, %144 ]
  %153 = phi i32 [ 0, %37 ], [ %120, %118 ], [ %146, %144 ]
  %154 = phi float [ %38, %37 ], [ %121, %118 ], [ %147, %144 ]
  %155 = sext i32 %39 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %155
  store float %154, float addrspace(1)* %156, align 4, !tbaa !20
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %155
  store i32 %152, i32 addrspace(1)* %157, align 4, !tbaa !22
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %155
  store i32 %153, i32 addrspace(1)* %158, align 4, !tbaa !22
  %159 = add i32 %32, %39
  %160 = icmp slt i32 %159, %10
  br i1 %160, label %37, label %161, !llvm.loop !28

161:                                              ; preds = %151, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !7, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
!28 = distinct !{!28, !25}
