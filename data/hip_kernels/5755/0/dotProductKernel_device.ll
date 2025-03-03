; ModuleID = '../data/hip_kernels/5755/0/main.cu'
source_filename = "../data/hip_kernels/5755/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16dotProductKernelPdS_iiS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, double addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = freeze i32 %2
  %21 = freeze i32 %19
  %22 = sdiv i32 %20, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %20, %23
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  %27 = add nsw i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = freeze i32 %3
  %30 = freeze i32 %14
  %31 = sdiv i32 %29, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %29, %32
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = add nsw i32 %31, %35
  %37 = mul i32 %27, %28
  %38 = add nsw i32 %37, %27
  %39 = tail call i32 @llvm.smin.i32(i32 %38, i32 %2)
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %41 = mul i32 %36, %40
  %42 = add nsw i32 %41, %36
  %43 = tail call i32 @llvm.smin.i32(i32 %42, i32 %3)
  %44 = icmp slt i32 %37, %2
  %45 = icmp slt i32 %41, %3
  %46 = select i1 %44, i1 %45, i1 false
  %47 = icmp slt i32 %37, %39
  %48 = select i1 %46, i1 %47, i1 false
  br i1 %48, label %49, label %167

49:                                               ; preds = %6
  %50 = icmp slt i32 %41, %43
  %51 = icmp sgt i32 %5, 0
  %52 = and i32 %5, 7
  %53 = icmp ult i32 %5, 8
  %54 = and i32 %5, -8
  %55 = icmp eq i32 %52, 0
  br label %56

56:                                               ; preds = %49, %63
  %57 = phi i32 [ %37, %49 ], [ %64, %63 ]
  br i1 %50, label %58, label %63

58:                                               ; preds = %56
  %59 = mul nsw i32 %57, %5
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = mul nsw i32 %57, %3
  br label %66

63:                                               ; preds = %160, %56
  %64 = add nsw i32 %57, 1
  %65 = icmp slt i32 %64, %39
  br i1 %65, label %56, label %167, !llvm.loop !16

66:                                               ; preds = %58, %160
  %67 = phi i32 [ %41, %58 ], [ %165, %160 ]
  %68 = mul nsw i32 %67, %5
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %1, i64 %69
  br i1 %51, label %71, label %160

71:                                               ; preds = %66
  br i1 %53, label %142, label %72

72:                                               ; preds = %71, %72
  %73 = phi i32 [ %139, %72 ], [ 0, %71 ]
  %74 = phi double [ %138, %72 ], [ 0.000000e+00, %71 ]
  %75 = phi i32 [ %140, %72 ], [ 0, %71 ]
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %61, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !18
  %79 = getelementptr inbounds double, double addrspace(1)* %70, i64 %76
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !18
  %81 = fmul contract double %78, %80
  %82 = fadd contract double %74, %81
  %83 = or i32 %73, 1
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %61, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !18
  %87 = getelementptr inbounds double, double addrspace(1)* %70, i64 %84
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !18
  %89 = fmul contract double %86, %88
  %90 = fadd contract double %82, %89
  %91 = or i32 %73, 2
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %61, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !18
  %95 = getelementptr inbounds double, double addrspace(1)* %70, i64 %92
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !18
  %97 = fmul contract double %94, %96
  %98 = fadd contract double %90, %97
  %99 = or i32 %73, 3
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %61, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !18
  %103 = getelementptr inbounds double, double addrspace(1)* %70, i64 %100
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !18
  %105 = fmul contract double %102, %104
  %106 = fadd contract double %98, %105
  %107 = or i32 %73, 4
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %61, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !18
  %111 = getelementptr inbounds double, double addrspace(1)* %70, i64 %108
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !18
  %113 = fmul contract double %110, %112
  %114 = fadd contract double %106, %113
  %115 = or i32 %73, 5
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %61, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !18
  %119 = getelementptr inbounds double, double addrspace(1)* %70, i64 %116
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !18
  %121 = fmul contract double %118, %120
  %122 = fadd contract double %114, %121
  %123 = or i32 %73, 6
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %61, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !18
  %127 = getelementptr inbounds double, double addrspace(1)* %70, i64 %124
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !18
  %129 = fmul contract double %126, %128
  %130 = fadd contract double %122, %129
  %131 = or i32 %73, 7
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %61, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !18
  %135 = getelementptr inbounds double, double addrspace(1)* %70, i64 %132
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !18
  %137 = fmul contract double %134, %136
  %138 = fadd contract double %130, %137
  %139 = add nuw nsw i32 %73, 8
  %140 = add i32 %75, 8
  %141 = icmp eq i32 %140, %54
  br i1 %141, label %142, label %72, !llvm.loop !22

142:                                              ; preds = %72, %71
  %143 = phi double [ undef, %71 ], [ %138, %72 ]
  %144 = phi i32 [ 0, %71 ], [ %139, %72 ]
  %145 = phi double [ 0.000000e+00, %71 ], [ %138, %72 ]
  br i1 %55, label %160, label %146

146:                                              ; preds = %142, %146
  %147 = phi i32 [ %157, %146 ], [ %144, %142 ]
  %148 = phi double [ %156, %146 ], [ %145, %142 ]
  %149 = phi i32 [ %158, %146 ], [ 0, %142 ]
  %150 = zext i32 %147 to i64
  %151 = getelementptr inbounds double, double addrspace(1)* %61, i64 %150
  %152 = load double, double addrspace(1)* %151, align 8, !tbaa !18
  %153 = getelementptr inbounds double, double addrspace(1)* %70, i64 %150
  %154 = load double, double addrspace(1)* %153, align 8, !tbaa !18
  %155 = fmul contract double %152, %154
  %156 = fadd contract double %148, %155
  %157 = add nuw nsw i32 %147, 1
  %158 = add i32 %149, 1
  %159 = icmp eq i32 %158, %52
  br i1 %159, label %160, label %146, !llvm.loop !23

160:                                              ; preds = %142, %146, %66
  %161 = phi double [ 0.000000e+00, %66 ], [ %143, %142 ], [ %156, %146 ]
  %162 = add nsw i32 %67, %62
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds double, double addrspace(1)* %4, i64 %163
  store double %161, double addrspace(1)* %164, align 8, !tbaa !18
  %165 = add nsw i32 %67, 1
  %166 = icmp slt i32 %165, %43
  br i1 %166, label %66, label %63, !llvm.loop !25

167:                                              ; preds = %63, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!15 = !{i32 0, i32 1024}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"double", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !17}
