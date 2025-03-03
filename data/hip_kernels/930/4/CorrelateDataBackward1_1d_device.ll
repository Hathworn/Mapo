; ModuleID = '../data/hip_kernels/930/4/main.cu'
source_filename = "../data/hip_kernels/930/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25CorrelateDataBackward1_1diiiiiiiiiiiiiiiiiiiPKfPfS0_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, float addrspace(1)* nocapture readonly %19, float addrspace(1)* nocapture writeonly %20, float addrspace(1)* nocapture readonly %21) local_unnamed_addr #0 {
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 12
  %30 = bitcast i8 addrspace(4)* %29 to i32 addrspace(4)*
  %31 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !6
  %32 = mul i32 %23, %28
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = add i32 %32, %33
  %35 = icmp slt i32 %34, %0
  br i1 %35, label %36, label %63

36:                                               ; preds = %22
  %37 = mul nsw i32 %10, 50000
  %38 = add nsw i32 %8, %7
  %39 = icmp sgt i32 %8, 0
  %40 = mul i32 %9, -2
  %41 = sub i32 %37, %6
  %42 = add nsw i32 %41, -1
  %43 = add i32 %42, %40
  %44 = add nsw i32 %37, -1
  %45 = add i32 %44, %40
  %46 = add nsw i32 %3, -1
  %47 = add nsw i32 %4, -1
  %48 = mul nsw i32 %15, %2
  %49 = mul nsw i32 %5, %2
  %50 = sub i32 %49, %7
  %51 = shl nsw i32 %9, 1
  %52 = add nuw nsw i32 %51, 1
  %53 = mul nsw i32 %52, %52
  %54 = mul nsw i32 %53, %16
  %55 = sitofp i32 %54 to float
  %56 = mul nsw i32 %17, %2
  %57 = udiv i32 %31, %28
  %58 = mul i32 %57, %28
  %59 = icmp ugt i32 %31, %58
  %60 = zext i1 %59 to i32
  %61 = add i32 %57, %60
  %62 = mul i32 %61, %28
  br label %64

63:                                               ; preds = %94, %22
  ret void

64:                                               ; preds = %36, %94
  %65 = phi i32 [ %34, %36 ], [ %104, %94 ]
  %66 = freeze i32 %65
  %67 = freeze i32 %16
  %68 = sdiv i32 %66, %67
  %69 = mul i32 %68, %67
  %70 = sub i32 %66, %69
  %71 = freeze i32 %12
  %72 = sdiv i32 %68, %71
  %73 = mul i32 %72, %71
  %74 = sub i32 %68, %73
  %75 = add nsw i32 %74, %18
  %76 = srem i32 %72, %13
  br i1 %39, label %77, label %94

77:                                               ; preds = %64
  %78 = add i32 %43, %75
  %79 = add i32 %45, %76
  %80 = sdiv i32 %79, %10
  %81 = add nsw i32 %80, -49999
  %82 = add nsw i32 %76, %37
  %83 = sdiv i32 %82, %10
  %84 = add nsw i32 %83, -50000
  %85 = icmp sgt i32 %83, 49999
  %86 = icmp slt i32 %81, %4
  %87 = tail call i32 @llvm.smax.i32(i32 %81, i32 0)
  %88 = tail call i32 @llvm.smin.i32(i32 %47, i32 %84)
  %89 = add nsw i32 %76, %48
  %90 = mul nsw i32 %89, %14
  %91 = add i32 %90, %75
  %92 = icmp sgt i32 %87, %88
  %93 = add i32 %37, %75
  br label %106

94:                                               ; preds = %156, %64
  %95 = phi float [ 0.000000e+00, %64 ], [ %157, %156 ]
  %96 = mul nsw i32 %70, %13
  %97 = add nsw i32 %76, %96
  %98 = mul nsw i32 %97, %12
  %99 = fdiv contract float %95, %55
  %100 = add i32 %74, %56
  %101 = add i32 %100, %98
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %20, i64 %102
  store float %99, float addrspace(1)* %103, align 4, !tbaa !16
  %104 = add i32 %62, %65
  %105 = icmp slt i32 %104, %0
  br i1 %105, label %64, label %63, !llvm.loop !20

106:                                              ; preds = %77, %156
  %107 = phi float [ 0.000000e+00, %77 ], [ %157, %156 ]
  %108 = phi i32 [ %7, %77 ], [ %158, %156 ]
  %109 = mul i32 %108, %11
  %110 = sub i32 %78, %109
  %111 = sdiv i32 %110, %10
  %112 = add nsw i32 %111, -49999
  %113 = add i32 %109, %6
  %114 = sub i32 %93, %113
  %115 = sdiv i32 %114, %10
  %116 = icmp sgt i32 %115, 49999
  %117 = select i1 %116, i1 %85, i1 false
  %118 = icmp slt i32 %112, %3
  %119 = select i1 %117, i1 %118, i1 false
  %120 = select i1 %119, i1 %86, i1 false
  br i1 %120, label %121, label %156

121:                                              ; preds = %106
  %122 = add nsw i32 %115, -50000
  %123 = tail call i32 @llvm.smax.i32(i32 %112, i32 0)
  %124 = tail call i32 @llvm.smin.i32(i32 %46, i32 %122)
  %125 = sub i32 %91, %109
  %126 = mul nsw i32 %125, %16
  %127 = add nsw i32 %126, %70
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %19, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  br i1 %92, label %156, label %131

131:                                              ; preds = %121
  %132 = add i32 %50, %108
  %133 = icmp sgt i32 %123, %124
  %134 = mul nsw i32 %132, %4
  br label %135

135:                                              ; preds = %131, %141
  %136 = phi float [ %107, %131 ], [ %142, %141 ]
  %137 = phi i32 [ %87, %131 ], [ %143, %141 ]
  br i1 %133, label %141, label %138

138:                                              ; preds = %135
  %139 = add nsw i32 %137, %134
  %140 = mul nsw i32 %139, %3
  br label %145

141:                                              ; preds = %145, %135
  %142 = phi float [ %136, %135 ], [ %153, %145 ]
  %143 = add nuw nsw i32 %137, 1
  %144 = icmp slt i32 %137, %88
  br i1 %144, label %135, label %156, !llvm.loop !22

145:                                              ; preds = %138, %145
  %146 = phi float [ %136, %138 ], [ %153, %145 ]
  %147 = phi i32 [ %123, %138 ], [ %154, %145 ]
  %148 = add nsw i32 %147, %140
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %21, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16
  %152 = fmul contract float %130, %151
  %153 = fadd contract float %146, %152
  %154 = add nuw nsw i32 %147, 1
  %155 = icmp slt i32 %147, %124
  br i1 %155, label %145, label %141, !llvm.loop !23

156:                                              ; preds = %141, %121, %106
  %157 = phi float [ %107, %106 ], [ %107, %121 ], [ %142, %141 ]
  %158 = add nsw i32 %108, 1
  %159 = icmp slt i32 %158, %38
  br i1 %159, label %106, label %94, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
