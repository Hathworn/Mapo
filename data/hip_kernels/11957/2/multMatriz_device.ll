; ModuleID = '../data/hip_kernels/11957/2/main.cu'
source_filename = "../data/hip_kernels/11957/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10multMatrizPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !16
  %26 = mul i32 %18, %22
  %27 = add i32 %26, %17
  %28 = icmp slt i32 %16, %3
  br i1 %28, label %29, label %193

29:                                               ; preds = %4
  %30 = icmp slt i32 %27, %3
  %31 = icmp eq i32 %3, 0
  %32 = udiv i32 %14, %11
  %33 = mul i32 %32, %11
  %34 = icmp ugt i32 %14, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %11
  %38 = and i32 %3, 7
  %39 = icmp ult i32 %3, 8
  %40 = and i32 %3, -8
  %41 = icmp eq i32 %38, 0
  br label %42

42:                                               ; preds = %29, %189
  %43 = phi i32 [ %16, %29 ], [ %191, %189 ]
  %44 = phi float [ 0.000000e+00, %29 ], [ %190, %189 ]
  br i1 %30, label %45, label %189

45:                                               ; preds = %42
  %46 = udiv i32 %25, %22
  %47 = mul i32 %46, %22
  %48 = icmp ugt i32 %25, %47
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = mul i32 %50, %22
  br label %52

52:                                               ; preds = %45, %79
  %53 = phi i32 [ %27, %45 ], [ %85, %79 ]
  %54 = phi float [ %44, %45 ], [ %81, %79 ]
  br i1 %31, label %79, label %55

55:                                               ; preds = %52
  %56 = mul nsw i32 %53, %3
  br i1 %39, label %57, label %87

57:                                               ; preds = %87, %55
  %58 = phi float [ undef, %55 ], [ %185, %87 ]
  %59 = phi i32 [ 0, %55 ], [ %186, %87 ]
  %60 = phi float [ %54, %55 ], [ %185, %87 ]
  br i1 %41, label %79, label %61

61:                                               ; preds = %57, %61
  %62 = phi i32 [ %76, %61 ], [ %59, %57 ]
  %63 = phi float [ %75, %61 ], [ %60, %57 ]
  %64 = phi i32 [ %77, %61 ], [ 0, %57 ]
  %65 = add i32 %62, %56
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !17
  %69 = mul i32 %62, %3
  %70 = add i32 %69, %43
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !17
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %63, %74
  %76 = add nuw i32 %62, 1
  %77 = add i32 %64, 1
  %78 = icmp eq i32 %77, %38
  br i1 %78, label %79, label %61, !llvm.loop !21

79:                                               ; preds = %57, %61, %52
  %80 = phi i32 [ 0, %52 ], [ %56, %61 ], [ %56, %57 ]
  %81 = phi float [ %54, %52 ], [ %58, %57 ], [ %75, %61 ]
  %82 = add nsw i32 %80, %43
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  store float %81, float addrspace(1)* %84, align 4, !tbaa !17
  %85 = add i32 %51, %53
  %86 = icmp slt i32 %85, %3
  br i1 %86, label %52, label %189, !llvm.loop !23

87:                                               ; preds = %55, %87
  %88 = phi i32 [ %186, %87 ], [ 0, %55 ]
  %89 = phi float [ %185, %87 ], [ %54, %55 ]
  %90 = phi i32 [ %187, %87 ], [ 0, %55 ]
  %91 = add i32 %88, %56
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !17
  %95 = mul i32 %88, %3
  %96 = add i32 %95, %43
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !17
  %100 = fmul contract float %94, %99
  %101 = fadd contract float %89, %100
  %102 = or i32 %88, 1
  %103 = add i32 %102, %56
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !17
  %107 = mul i32 %102, %3
  %108 = add i32 %107, %43
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !17
  %112 = fmul contract float %106, %111
  %113 = fadd contract float %101, %112
  %114 = or i32 %88, 2
  %115 = add i32 %114, %56
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !17
  %119 = mul i32 %114, %3
  %120 = add i32 %119, %43
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !17
  %124 = fmul contract float %118, %123
  %125 = fadd contract float %113, %124
  %126 = or i32 %88, 3
  %127 = add i32 %126, %56
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !17
  %131 = mul i32 %126, %3
  %132 = add i32 %131, %43
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !17
  %136 = fmul contract float %130, %135
  %137 = fadd contract float %125, %136
  %138 = or i32 %88, 4
  %139 = add i32 %138, %56
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !17
  %143 = mul i32 %138, %3
  %144 = add i32 %143, %43
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !17
  %148 = fmul contract float %142, %147
  %149 = fadd contract float %137, %148
  %150 = or i32 %88, 5
  %151 = add i32 %150, %56
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %0, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !17
  %155 = mul i32 %150, %3
  %156 = add i32 %155, %43
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !17
  %160 = fmul contract float %154, %159
  %161 = fadd contract float %149, %160
  %162 = or i32 %88, 6
  %163 = add i32 %162, %56
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !17
  %167 = mul i32 %162, %3
  %168 = add i32 %167, %43
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !17
  %172 = fmul contract float %166, %171
  %173 = fadd contract float %161, %172
  %174 = or i32 %88, 7
  %175 = add i32 %174, %56
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !17
  %179 = mul i32 %174, %3
  %180 = add i32 %179, %43
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !17
  %184 = fmul contract float %178, %183
  %185 = fadd contract float %173, %184
  %186 = add nuw i32 %88, 8
  %187 = add i32 %90, 8
  %188 = icmp eq i32 %187, %40
  br i1 %188, label %57, label %87, !llvm.loop !25

189:                                              ; preds = %79, %42
  %190 = phi float [ %44, %42 ], [ %81, %79 ]
  %191 = add i32 %37, %43
  %192 = icmp slt i32 %191, %3
  br i1 %192, label %42, label %193, !llvm.loop !26

193:                                              ; preds = %189, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !24}
!26 = distinct !{!26, !24}
