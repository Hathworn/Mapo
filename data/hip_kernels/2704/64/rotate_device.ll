; ModuleID = '../data/hip_kernels/2704/64/main.cu'
source_filename = "../data/hip_kernels/2704/64/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6rotatePffS_iiiiiiiii(float addrspace(1)* nocapture readonly %0, float %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !6
  %22 = mul i32 %13, %18
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = udiv i32 %21, %18
  %26 = mul i32 %25, %18
  %27 = icmp ugt i32 %21, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %18
  %31 = mul nsw i32 %10, %9
  %32 = mul nsw i32 %31, %11
  %33 = mul nsw i32 %4, %3
  %34 = mul nsw i32 %33, %5
  %35 = sdiv i32 %34, %32
  %36 = sdiv i32 %34, %30
  %37 = mul nsw i32 %36, %24
  %38 = mul nsw i32 %35, %9
  %39 = icmp sgt i32 %11, -1
  br i1 %39, label %40, label %181

40:                                               ; preds = %12
  %41 = mul nsw i32 %38, %10
  %42 = sdiv i32 %37, %41
  %43 = srem i32 %42, %11
  %44 = sdiv i32 %37, %38
  %45 = srem i32 %44, %10
  %46 = freeze i32 %37
  %47 = freeze i32 %35
  %48 = sdiv i32 %46, %47
  %49 = srem i32 %48, %9
  %50 = mul i32 %48, %47
  %51 = sub i32 %46, %50
  %52 = add nsw i32 %35, -1
  %53 = add nsw i32 %36, -1
  br label %54

54:                                               ; preds = %40, %172
  %55 = phi float [ undef, %40 ], [ %178, %172 ]
  %56 = phi float [ undef, %40 ], [ %177, %172 ]
  %57 = phi i32 [ 0, %40 ], [ %176, %172 ]
  %58 = phi i32 [ %43, %40 ], [ %179, %172 ]
  %59 = phi i32 [ %45, %40 ], [ 0, %172 ]
  %60 = phi i32 [ %49, %40 ], [ %175, %172 ]
  %61 = phi i32 [ %51, %40 ], [ %174, %172 ]
  %62 = phi i32 [ %37, %40 ], [ %173, %172 ]
  %63 = icmp slt i32 %59, %10
  br i1 %63, label %64, label %172

64:                                               ; preds = %54, %169
  %65 = phi float [ %78, %169 ], [ %55, %54 ]
  %66 = phi float [ %77, %169 ], [ %56, %54 ]
  %67 = phi i32 [ %76, %169 ], [ %57, %54 ]
  %68 = phi i32 [ %170, %169 ], [ %59, %54 ]
  %69 = phi i32 [ 0, %169 ], [ %60, %54 ]
  %70 = phi i32 [ %74, %169 ], [ %61, %54 ]
  %71 = phi i32 [ %73, %169 ], [ %62, %54 ]
  br label %72

72:                                               ; preds = %64, %143
  %73 = phi i32 [ %144, %143 ], [ %71, %64 ]
  %74 = phi i32 [ 0, %143 ], [ %70, %64 ]
  %75 = phi i32 [ %151, %143 ], [ %69, %64 ]
  %76 = phi i32 [ %167, %143 ], [ %67, %64 ]
  %77 = phi float [ %149, %143 ], [ %66, %64 ]
  %78 = phi float [ %150, %143 ], [ %65, %64 ]
  %79 = icmp slt i32 %75, %9
  br i1 %79, label %80, label %169

80:                                               ; preds = %72
  %81 = mul nsw i32 %74, %6
  %82 = add nsw i32 %75, %81
  %83 = srem i32 %82, %3
  %84 = mul nsw i32 %74, %7
  %85 = add nsw i32 %84, %68
  %86 = srem i32 %85, %4
  %87 = mul nsw i32 %74, %8
  %88 = add nsw i32 %87, %58
  %89 = srem i32 %88, %5
  %90 = icmp slt i32 %76, %36
  br i1 %90, label %91, label %99

91:                                               ; preds = %80
  %92 = mul nsw i32 %86, %3
  %93 = add nsw i32 %92, %83
  %94 = mul nsw i32 %89, %33
  %95 = add nsw i32 %93, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %99

99:                                               ; preds = %91, %80
  %100 = phi float [ %98, %91 ], [ %77, %80 ]
  %101 = icmp slt i32 %74, %52
  br i1 %101, label %102, label %143

102:                                              ; preds = %99, %138
  %103 = phi float [ %132, %138 ], [ %78, %99 ]
  %104 = phi float [ %141, %138 ], [ %100, %99 ]
  %105 = phi i32 [ %137, %138 ], [ %76, %99 ]
  %106 = phi i32 [ %121, %138 ], [ %89, %99 ]
  %107 = phi i32 [ %119, %138 ], [ %86, %99 ]
  %108 = phi i32 [ %117, %138 ], [ %83, %99 ]
  %109 = phi i32 [ %139, %138 ], [ %74, %99 ]
  %110 = phi i32 [ %115, %138 ], [ %73, %99 ]
  %111 = icmp slt i32 %105, %36
  %112 = icmp slt i32 %110, %34
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %181

114:                                              ; preds = %102
  %115 = add nsw i32 %110, 1
  %116 = add nsw i32 %108, %6
  %117 = srem i32 %116, %3
  %118 = add nsw i32 %107, %7
  %119 = srem i32 %118, %4
  %120 = add nsw i32 %106, %8
  %121 = srem i32 %120, %5
  %122 = mul nsw i32 %119, %3
  %123 = add nsw i32 %122, %117
  %124 = mul nsw i32 %121, %33
  %125 = add nsw i32 %123, %124
  %126 = icmp slt i32 %105, %53
  %127 = sext i32 %125 to i64
  br i1 %126, label %128, label %131

128:                                              ; preds = %114
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %131

131:                                              ; preds = %114, %128
  %132 = phi float [ %130, %128 ], [ %103, %114 ]
  %133 = fpext float %104 to double
  %134 = fadd contract double %133, 1.000000e-01
  %135 = fptrunc double %134 to float
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  store float %135, float addrspace(1)* %136, align 4, !tbaa !16
  %137 = add nsw i32 %105, 1
  br i1 %126, label %138, label %181

138:                                              ; preds = %131
  %139 = add nsw i32 %109, 1
  %140 = icmp slt i32 %137, %36
  %141 = select i1 %140, float %132, float %104
  %142 = icmp slt i32 %139, %52
  br i1 %142, label %102, label %143, !llvm.loop !20

143:                                              ; preds = %138, %99
  %144 = phi i32 [ %73, %99 ], [ %115, %138 ]
  %145 = phi i32 [ %83, %99 ], [ %117, %138 ]
  %146 = phi i32 [ %86, %99 ], [ %119, %138 ]
  %147 = phi i32 [ %89, %99 ], [ %121, %138 ]
  %148 = phi i32 [ %76, %99 ], [ %137, %138 ]
  %149 = phi float [ %100, %99 ], [ %141, %138 ]
  %150 = phi float [ %78, %99 ], [ %132, %138 ]
  %151 = add nsw i32 %75, 1
  %152 = add nsw i32 %145, %6
  %153 = srem i32 %152, %3
  %154 = add nsw i32 %146, %7
  %155 = srem i32 %154, %4
  %156 = add nsw i32 %147, %8
  %157 = srem i32 %156, %5
  %158 = mul nsw i32 %155, %3
  %159 = add nsw i32 %158, %153
  %160 = mul nsw i32 %157, %33
  %161 = add nsw i32 %159, %160
  %162 = fpext float %149 to double
  %163 = fadd contract double %162, 1.000000e-01
  %164 = fptrunc double %163 to float
  %165 = sext i32 %161 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  store float %164, float addrspace(1)* %166, align 4, !tbaa !16
  %167 = add nsw i32 %148, 1
  %168 = icmp slt i32 %148, %53
  br i1 %168, label %72, label %181, !llvm.loop !22

169:                                              ; preds = %72
  %170 = add nsw i32 %68, 1
  %171 = icmp slt i32 %170, %10
  br i1 %171, label %64, label %172, !llvm.loop !23

172:                                              ; preds = %169, %54
  %173 = phi i32 [ %62, %54 ], [ %73, %169 ]
  %174 = phi i32 [ %61, %54 ], [ %74, %169 ]
  %175 = phi i32 [ %60, %54 ], [ 0, %169 ]
  %176 = phi i32 [ %57, %54 ], [ %76, %169 ]
  %177 = phi float [ %56, %54 ], [ %77, %169 ]
  %178 = phi float [ %55, %54 ], [ %78, %169 ]
  %179 = add nsw i32 %58, 1
  %180 = icmp slt i32 %179, %11
  br i1 %180, label %54, label %181, !llvm.loop !24

181:                                              ; preds = %172, %143, %131, %102, %12
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
